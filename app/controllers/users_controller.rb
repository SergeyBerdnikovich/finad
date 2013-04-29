class UsersController < InheritedResources::Base
  def index
  end

  def show
    @user = User.find(params[:id])
    @advisers = Adviser.where('city = ?', @user.city.strip).sort_by(params[:sort]).page(params[:page])
  end

  def new
    @user = User.new(:zip => params[:user][:zip])
  end

  def create
    @user = User.new(params[:user])
    @user.phone = "(#{params[:user][:phone1]})#{params[:user][:phone2]}-#{params[:user][:phone3]}"
    @user.hashstr = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join

    respond_to do |format|
      if @user.save
        UserMailer.deliver_registration_confirmation(@user).deliver
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully created.' }
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
end
