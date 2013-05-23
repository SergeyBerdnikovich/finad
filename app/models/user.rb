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

  STATE = {
    'AL' => 'Alabama',
    'AK' => 'Alaska',
    'AB' => 'Alberta',
    'AS' => 'American Somoa',
    'AZ' => 'Arizona',
    'AR' => 'Arkansas',
    'BC' => 'British Columbia',
    'CA' => 'California',
    'FM' => 'Caroline Islands',
    'CO' =>'Colorado',
    'CT' => 'Connecticut',
    'DE' => 'Delaware',
    'DC' => 'District of Columbia',
    'FL' => 'Florida',
    'GA' => 'Georgia',
    'GU' => 'Guam',
    'HI' => 'Hawaii',
    'ID' => 'Idaho',
    'IL' => 'Illinois',
    'IN' => 'Indiana',
    'IA' => 'Iowa',
    'IN' => 'Indiana',
    'KS' => 'Kansas',
    'KY' => 'Kentucky',
    'LA' => 'Louisiana',
    'ME' => 'Maine',
    'MB' => 'Manitoba',
    'MP' => 'Mariana Islands',
    'MH' => 'Marshall Islands',
    'MD' => 'Maryland',
    'MA' => 'Massachusetts',
    'MI' => 'Michigan',
    'MN' => 'Minnesota',
    'MS' => 'Mississippi',
    'MO' => 'Missouri',
    'MT' => 'Montana',
    'NE' => 'Nebraska',
    'NV' => 'Nevada',
    'NB' => 'New Brunswick',
    'NF' => 'New Foundland',
    'NH' => 'New Hampshire',
    'NJ' => 'New Jersey',
    'NM' => 'New Mexico',
    'NY' => 'New York',
    'NC' => 'North Carolina',
    'ND' => 'North Dakota',
    'NT' => 'NorthWest Territories',
    'NS' => 'Nova Scotia',
    'OH' => 'Ohio',
    'OK' => 'Oklahoma',
    'ON' => 'Ontario',
    'OR' => 'Oregon',
    'PA' => 'Pennsylvania',
    'PE' => 'Prince Edward Island',
    'PR' => 'Puerto Rico',
    'QC' => 'Quebec',
    'RI' => 'Rhode Island',
    'SK' => 'Saskatchewan',
    'SC' => 'South Carolina',
    'SD' => 'South Dakota',
    'TN' => 'Tennessee',
    'TX' => 'Texas',
    'UT' => 'Utah',
    'VT' => 'Vermont',
    'VI' => 'Virgin Islands',
    'VA' => 'Virginia',
    'WA' => 'Washington',
    'WV' => 'West Virginia',
    'WI' => 'Wisconsin',
    'WY' => 'Wyoming',
    'YT' => 'Yukon Territory'
  }
end
