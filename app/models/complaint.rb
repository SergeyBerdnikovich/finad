class Complaint < ActiveRecord::Base
  attr_accessible :adviser_name, :adviser_phone, :complain, :contact_time, :email, :name, :phone, :adviser_id

  validates_length_of :adviser_name, :minimum => 3, :maximum => 400, :allow_blank => false
  validates_length_of :adviser_phone, :minimum => 3, :maximum => 400, :allow_blank => false
  validates_length_of :contact_time, :minimum => 3, :maximum => 400, :allow_blank => false
  #validates_length_of :email, :minimum => 3, :maximum => 400, :allow_blank => false
  validates_length_of :name, :minimum => 3, :maximum => 400, :allow_blank => false
  validates_length_of :phone, :minimum => 3, :maximum => 400, :allow_blank => false
  validates_length_of :complain, :minimum => 15, :maximum => 60000, :allow_blank => false

end
