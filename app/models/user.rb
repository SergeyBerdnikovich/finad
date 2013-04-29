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

  SERVICE = {
    '19400' => 'Portfolio Management',
    '70675' => 'Retirement Planning',
    '70676' => 'Estate Planning',
    '76773' => 'Education Planning',
    '76774' => '401K Rollover'
  }

  PORTFOLIO = {
    '76473' => 'Less than $50,000',
    '27721' => '$50,000 - $100,000',
    '27722' => '$100,000 - $250,000',
    '27723' => '$250,000 - $500,000',
    '27724' => '$500,000 - $1 million',
    '36716' => '$1 million - $3 million',
    '36717' => 'More Than $3 million',
    '77004' => 'Prefer to Disclose Directly to Advisor'
  }
end
