class Adviser < ActiveRecord::Base
  attr_accessible :address, :city, :name, :phone, :stars, :state, :url, :zip

  paginates_per 15

  def self.sort_by(sort_type_params)
    if sort_type_params == 'Name'
      sort_type = 'name'
    elsif sort_type_params == 'Address'
      sort_type = 'address'
    elsif sort_type_params == 'Stars'
      sort_type = 'stars'
    else
      sort_type = 'name'
    end

    order("advisers.#{sort_type} ASC")
  end
end
