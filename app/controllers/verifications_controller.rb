class VerificationsController < InheritedResources::Base
  def create
    @verification = Verification.new(params[:verification])

    respond_to do |format|
      if @verification.save
        UserMailer.send_verification_confirm_to_user(@verification).deliver
        UserMailer.send_verification_confirm_to_admin(@verification).deliver

        format.html { redirect_to verifications_path(:verification_id => @verification.id), notice: 'Verification was successfully created.' }
        format.json { render json: @verification, status: :created, location: @verification }
      else
        format.html { render action: "new" }
        format.json { render json: @verification.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
   # @verification = Verification.find(params[:verification_id])
  end
end
