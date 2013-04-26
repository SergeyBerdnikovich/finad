class UsersController < InheritedResources::Base
  def index
  end

  def show
  end

  def new
    @user = User.new(:zip => params[:user][:zip])
  end

  def create
    @user = User.new(params[:user])
    @user.phone = "(#{params[:user][:phone1]})#{params[:user][:phone2]}-#{params[:user][:phone3]}"

    respond_to do |format|
      if @user.save
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
        format.html { redirect_to edit_user_path(@user), notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
