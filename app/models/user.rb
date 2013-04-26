class User < ActiveRecord::Base
  attr_accessible :city, :email, :first_name, :info, :last_name, :phone, :portfolio, :service, :state, :zip, :phone1, :phone2, :phone3

  def phone1
    @phone1
  end
  def phone2
    @phone2
  end
  def phone3
    @phone3
  end
  def phone1=(phone1)
    @phone1 = phone1
  end
  def phone2=(phone2)
    @phone2 = phone2
  end
  def phone3=(phone3)
    @phone3 = phone3
  end
end
