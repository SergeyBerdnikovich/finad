class Rating < ActiveRecord::Base
  attr_accessible :name
  has_many :advisers
end
