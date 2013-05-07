class AdvisersController < ApplicationController
  
  def show
    @adviser = Adviser.find(params[:id])
  end

  def edit
    @adviser = Adviser.find(params[:id])
    @adviser.build_gallery unless @adviser.gallery
  end

  def update
    params[:adviser][:zip].gsub!(/[^0-9]/,"")
    @adviser = Adviser.find(params[:id])

    respond_to do |format|
      if @adviser.update_attributes(params[:adviser])
        format.html { redirect_to adviser_path(@adviser), notice: 'Adviser was successfully updated.' }
        format.json { render action: 'show', status: :created, location: @adviser }
      else
        format.html { render action: 'new' }
        format.json { render json: @adviser.errors, status: :unprocessable_entity }
      end
    end
  end
end
