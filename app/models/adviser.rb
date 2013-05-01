class Adviser < ActiveRecord::Base
  attr_accessible :address, :city, :name, :phone, :stars, :state, :url, :zip

  paginates_per 15

  def self.sort_by(sort_type_params, sortable_params)
    if sort_type_params == 'Name'
      sort_type = 'name'
    elsif sort_type_params == 'Address'
      sort_type = 'address'
    elsif sort_type_params == 'Stars'
      sort_type = 'stars'
    else
      sort_type = 'stars'
    end

    if sortable_params == 'ASC'
      sortable = 'ASC'
    else
      sortable = 'DESC'
    end

    order("advisers.#{sort_type} #{sortable}")
  end
end
