class AdvisersController < ApplicationController
  before_filter :check_current_adviser_user, :only => [:find_adviser, :check_adviser]

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
    name, zip = params[:name], params[:zip]
    adviser = Adviser.find_by_name_and_zip(name, zip)
    if adviser && adviser.adviser_user_id.blank? && adviser.update_attribute(:adviser_user_id, current_adviser_user.id)
      redirect_to adviser_path(adviser), :notice => 'We already have found your profile'
    elsif adviser && adviser.adviser_user_id
      redirect_to advisers_find_adviser_path, :notice => 'Advoser with the same name has been already registered. Please contact us to help solve you this situation.'
    else
      adviser = current_adviser_user.adviser.create!(:verified => true)
      redirect_to edit_adviser_path(adviser), :notice => 'We could not find your profile and create a new'
    end
  end

def check_adviser_user
  if @adviser != nil
  if @adviser.adviser_user != nil
    return true if current_adviser_user && current_adviser_user.id == @adviser.adviser_user.id
  end
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

  if @adviser.verified && current_adviser_user && current_adviser_user.id == @adviser.adviser_user.id
    @adviser = Adviser.find(params[:id])
    @adviser.build_gallery unless @adviser.gallery
  elsif current_adviser_user && current_adviser_user.id == @adviser.adviser_user.id && @adviser.verified.blank?
    redirect_to adviser_path(@adviser), notice: 'Verification failed.'
  else
    redirect_to  new_adviser_user_session_path, notice: 'Authorization failed.'
  end
end


def contact

  @adviser = Adviser.find(params[:id])
  if @adviser.adviser_user
    @adviser.email = @adviser.adviser_user.email
  end

  @owner = check_adviser_user
  @user_hashstr = User.find(session[:user_id]).try(:hashstr) if session[:user_id]
  @user = User.find_by_id_and_hashstr(params[:id], @user_hashstr) if   @user_hashstr

  respond_to do |format|
    ok = false
    if params[:email] != nil
      if params[:email].length > 5
        ok = true
      end
    end

    if ok
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
    if @adviser.verified && current_adviser_user && current_adviser_user.id == @adviser.adviser_user.id
      if @adviser.update_attributes(params[:adviser])
        format.html { redirect_to adviser_path(@adviser), notice: 'Adviser was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @adviser }
      else
        format.html { render action: 'new' }
        format.json { render json: @adviser.errors, status: :unprocessable_entity }
      end
    else
      redirect_to new_adviser_user_session_path, notice: 'Authorization failed.'
    end
  end
end

  private

  def check_current_adviser_user
    redirect_to root_path unless current_adviser_user
  end
end
