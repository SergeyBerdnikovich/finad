class Verification < ActiveRecord::Base
  attr_accessible :adviser_id, :email, :name, :phone, :adviser_user_id, :adviser_attributes
  belongs_to :adviser_user
  belongs_to :adviser

  accepts_nested_attributes_for :adviser,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  validates :email, :presence => true
end
