module AdvisersHelper
  def owner?
    current_adviser_user.try(:adviser).try(:id).try(:to_s) == params[:id] || current_adviser_user.try(:adviser).try(:slug).try(:to_s) == params[:id]
  end
  def verified?
    current_adviser_user.try(:adviser).try(:verified)
  end
end
