class OfficeHour < ActiveRecord::Base
  belongs_to :adviser
  attr_accessible :day_of_the_week, :end, :start
end
