class Service < ActiveRecord::Base
  attr_accessible :adviser_id, :description, :name
  belongs_to :adviser
end
