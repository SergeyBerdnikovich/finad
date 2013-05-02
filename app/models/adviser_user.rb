class AdviserUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  alias_attribute :name, :email

  has_one :adviser
  after_create :create_adviser

  def create_adviser
    self.adviser = Adviser.create!(:stars => 2)
  end
end
