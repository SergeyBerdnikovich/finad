class Adviser < ActiveRecord::Base
  attr_accessible :address, :city, :name, :phone, :stars, :state, :url, :zip

  paginates_per 20
end
