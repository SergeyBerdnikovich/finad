class AdvisersController < ApplicationController
  def check_adviser_user
    return true if current_adviser_user && current_adviser_user.id == @adviser.adviser_user.id
    return false
  end

  def show
    @adviser = Adviser.find(params[:id])
    @owner = check_adviser_user
    #if @adviser.photo == nil
    #  @adviser.photo == "default.gif"
    #end
  end

  def edit
    if current_adviser_user && current_adviser_user.id == @adviser.adviser_user.id
      @adviser = Adviser.find(params[:id])
      @adviser.build_gallery unless @adviser.gallery
    else
      redirect_to root_path, notice: 'Authorization failed.'
    end
  end

  def update
    params[:adviser][:zip].gsub!(/[^0-9]/,"")
    @adviser = Adviser.find(params[:id])

    respond_to do |format|
      if current_adviser_user && current_adviser_user.id == @adviser.adviser_user.id
        if @adviser.update_attributes(params[:adviser])
          format.html { redirect_to adviser_path(@adviser), notice: 'Adviser was successfully updated.' }
          format.json { render action: 'show', status: :created, location: @adviser }
        else
          format.html { render action: 'new' }
          format.json { render json: @adviser.errors, status: :unprocessable_entity }
        end
      else
        redirect_to root_path, notice: 'Authorization failed.'
      end
    end
  end
end
