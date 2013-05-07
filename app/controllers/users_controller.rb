class UsersController < InheritedResources::Base
  before_filter :ckeck_hash, :only => [:show, :edit]

  def index
  end

  def show
    @user = User.find(params[:id])
#    @advisers = Adviser.where('city = ?', @user.city.strip).sort_by(params[:sort]).page(params[:page])

    minzip = @user.zip - 50
    maxzip = @user.zip + 50

    @advisers = Adviser.where('zip >= ? AND zip <= ?', minzip, maxzip).sort_by(params[:sort], params[:sortable]).page(params[:page])
  end

  def new

    params[:user][:zip].gsub!(/[^0-9]/,"") if params[:user][:zip]

    @adviser = Adviser.find_by_zip(params[:user][:zip]) if params[:user][:zip]
    @user = User.new(params[:user])
    @adviser ? @city = @adviser.city : @city = @user.city
    @adviser ? @state = @adviser.state : @state = @user.state
  end

  def create

    params[:user][:zip].gsub!(/[^0-9]/,"") if  params[:user][:zip]

    @user = User.new(params[:user])
    @user.phone = "(#{params[:user][:phone1]})#{params[:user][:phone2]}-#{params[:user][:phone3]}"
    @user.hashstr = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
    

    respond_to do |format|
      if @user.save
        UserMailer.deliver_registration_confirmation(@user).deliver
        format.html { redirect_to users_email_link_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    params[:user][:phone] = "(#{params[:user][:phone1]})#{params[:user][:phone2]}-#{params[:user][:phone3]}"
    params[:user][:zip].gsub!(/[^0-9]/,"")

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def email_link

  end

  def ckeck_hash
    if params[:id] && params[:hash]
      user = User.find_by_id_and_hashstr(params[:id], params[:hash])
      user ? (session[:user_id] = user.id) : (redirect_to root_path)
    else
      user_hashstr = User.find(session[:user_id]).try(:hashstr) if session[:user_id]
      user = User.find_by_id_and_hashstr(params[:id], user_hashstr) if user_hashstr

      redirect_to root_path unless user
    end
  end
end
