class Verification < ActiveRecord::Base
  attr_accessible :adviser_id, :email, :name, :phone, :user_id

  validates :email, :presence => true
end
