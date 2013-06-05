class AdvisersController < ApplicationController
  before_filter :check_current_adviser_user, :only => [:find_adviser, :check_adviser, :set_adviser, :contact_question, :contact_form, :edit, :update]
  layout :resolve_layout

  def contact_popup
     @adviser = Adviser.find(params[:adviser_id])
     
       render :layout => "empty"
  end

  def index
    if request.referer.blank? == false
      if request.referer.index("investmentprotectionbureau.org") != nil
        if current_adviser_user
          redirect_to adviser_path(Adviser.find_by_adviser_user_id(current_adviser_user))
        else
          redirect_to new_adviser_user_session_path, notice: 'Please log in.'
        end
      else
          redirect_to "https://investmentprotectionbureau.org/index.php/en/?fs"
      end
    else
         if current_adviser_user
          redirect_to adviser_path(Adviser.find_by_adviser_user_id(current_adviser_user))
        else
          redirect_to "https://investmentprotectionbureau.org/index.php/en/?fs"
        end
    end
  end

def register
  if check_adviser_user
       redirect_to adviser_path(Adviser.find_by_adviser_user_id(current_adviser_user))
  else
       redirect_to new_adviser_user_registration_path
  end
end

  def find_adviser
    redirect_to edit_adviser_path(current_adviser_user.adviser) if current_adviser_user.adviser
  end

  def check_adviser
    redirect_to advisers_find_adviser_path if params[:firstname].blank? || params[:lastname].blank?
    firstname, lastname = params[:firstname], params[:lastname]
    @advisers = Adviser.where("name RLIKE ? ",".*(#{firstname}|#{lastname}).*(#{lastname}|#{firstname}).*")
  end

  def set_adviser
    if params[:id] == '0' && params[:adviser] == 'new'
      adviser = current_adviser_user.adviser = Adviser.create!(:verified => true)
      UserMailer.send_adviser_info_to_admin(adviser).deliver
      UserMailer.send_adviser_info_to_user(adviser).deliver
      #3
      redirect_to edit_adviser_path(adviser)
    else
      adviser = Adviser.find(params[:id])
      if adviser
        if adviser.adviser_user_id
          redirect_to advisers_find_adviser_path, :notice => 'This adviser already has an account ...'
        else
          current_adviser_user.adviser = adviser
          #UserMailer.send_adviser_info_to_admin(adviser).deliver
          UserMailer.send_adviser_info_to_user(adviser).deliver
          #3
          redirect_to new_verification_path(:adviser_id => adviser.id)
        end
      else
        redirect_to advisers_find_adviser_path, :notice => 'Adviser not found...'
      end
    end
  end

  def alphabet
    params[:char] ||= 'A'
    @advisers = Adviser.where("advisers.name LIKE ?", "#{params[:char]}%")
  end

  def consultation
    adviser = Adviser.find(params[:id])
    consultation = params[:consultation]

    UserMailer.send_consultation_to_admin(adviser, consultation).deliver

    redirect_to adviser_path(adviser), :notice => 'Your request has been sent...'
  end

def check_adviser_user
  if @adviser && @adviser.adviser_user
    return true if current_adviser_user && current_adviser_user.id == @adviser.adviser_user.id
  end
  return false
end

def featured
  @advisers = Adviser.where('featured = 1').sort_by(params[:sort], params[:sortable]).page(params[:page])
end


def featured2
  @advisers = Adviser.where('featured = 1').sort_by(params[:sort], params[:sortable]).limit(8)
  render :layout => false
end

  def show
    @adviser = Adviser.find(params[:id])

  if @adviser.adviser_user
        @adviser.email = @adviser.adviser_user.email
      end
    @owner = check_adviser_user
    if @owner == false
        @adviser.bio = "To request a backround check on this advisor please use the contact button below or for immediate assistance call 1-888-735-9553" if @adviser.bio == nil
    end
    @user_hashstr = User.find(session[:user_id]).try(:hashstr) if session[:user_id]
    @user = User.find_by_id_and_hashstr(session[:user_id], @user_hashstr) if   @user_hashstr

    #if @adviser.photo == nil
    #  @adviser.photo == "default.gif"
    #end
  end


def edit
  @adviser = Adviser.find(params[:id])
  @adviser.advisers_questions.build

  if @adviser.verified && current_adviser_user.id == @adviser.adviser_user.id
    @adviser = Adviser.find(params[:id])
    @adviser.build_gallery unless @adviser.gallery
  elsif current_adviser_user && current_adviser_user.id == @adviser.adviser_user.id && @adviser.verified.blank?
    redirect_to adviser_path(@adviser), notice: 'Verification failed.'
  else
    redirect_to  new_adviser_user_session_path, notice: 'Authorization failed.'
  end
end

  def contact_form

  end

  def contact_question
    respond_to do |format|
      if params[:question].present? && params[:question].length > 5
        UserMailer.send_contact_question(@user, params[:question]).deliver
        format.html { redirect_to contact_form_path, notice: 'Request was successfully sent!' }
      else
        format.html { redirect_to root_path, alert: 'Please specify correct question!' }
      end
    end
  end

  def contact
    @adviser = Adviser.find(params[:id])
    if params['src'] == 'popupform'
      message = ""
      message += "Name: #{params[:firstnm]}, #{params[:lastnm]}
      "
      message += "City, state: #{params[:sendcity]}, #{params[:sendstate]}
      "
      message += "Email: #{params[:email]}
      "
      message += "Phone: #{params[:harea]} #{params[:hphone3]} #{params[:hphone4]}
      "
      message += "Service client interesting in: #{params[:service]}
      "
      message += "Portfolio size: #{params[:portfolio]}
      "
      params[:comment] = message

    end

    @adviser.update_attribute(:email, @adviser.adviser_user.email) if @adviser.adviser_user && @adviser.adviser_user.email.blank?
    @owner = check_adviser_user
    @user_hashstr = User.find(session[:user_id]).try(:hashstr) if session[:user_id]
    @user = User.find_by_id_and_hashstr(params[:id], @user_hashstr) if @user_hashstr
   
    respond_to do |format|
      if params[:email].present? && params[:email].length > 5
        UserMailer.contact(@adviser, @user, params[:email], params[:comment]).deliver
        format.html { redirect_to adviser_path(@adviser), notice: 'Request was successfully sent!' }
      else
        format.html { redirect_to adviser_path(@adviser, :email => params[:email], :comment => params[:comment]), alert: 'Please specify correct email!' }
      end
    end
  end

def update
  params[:adviser][:zip].gsub!(/[^0-9]/,"")
  @adviser = Adviser.find(params[:id])

  respond_to do |format|
    if @adviser.verified && current_adviser_user.id == @adviser.adviser_user.id
      check_question(@adviser, params[:advisers_questions])
      if @adviser.update_attributes(params[:adviser])
        format.html { redirect_to adviser_path(@adviser), notice: 'Adviser was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @adviser }
      else
        format.html { render action: 'new' }
        format.json { render json: @adviser.errors, status: :unprocessable_entity }
      end
    else
      redirect_to new_adviser_user_session_path, notice: 'You are not verified, please verify the account!'
    end
  end
end

  private

  def check_current_adviser_user
    redirect_to root_path unless current_adviser_user
  end

  def resolve_layout
    case action_name
    when "show", "edit"
      "adviser_layout"
    else
      "application"
    end
  end

  def check_question(adviser, advisers_questions)
    advisers_questions.each do |aq|
      old_aq = adviser.advisers_questions.where("question_id = ?", aq['question_id'])
      if old_aq.blank?
        adviser.advisers_questions.create!(:question_id => aq['question_id'], :answer => aq['answer']) unless aq['answer'].blank?
      else
        aq['answer'].blank? ? old_aq.last.destroy : old_aq.last.update_attribute(:answer, aq['answer'])
      end
    end
  end
end
