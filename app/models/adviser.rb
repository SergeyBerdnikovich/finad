class Adviser < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

<<<<<<< HEAD

  attr_accessible :featured, :address, :city, :name, :phone, :rating_id,
                  :state, :url, :zip, :adviser_user_id, :gallery_attributes,
                  :plan, :blog_url, :verified, :years_of_experience, :education,
                  :short_description, :education, :years_of_experience, :short_description, :company_data, :bio,
                  :experience, :offers_and_pledges, :compensation_arrangements, :open_hours

  paginates_per 15


=======
>>>>>>> d0852ba3ead976fd4cf4835823a48be3f388abe3
  has_one :gallery, :dependent => :destroy
  belongs_to :adviser_user
  belongs_to :rating
  has_one :verification
  has_many :services
  has_many :office_hours
  has_many :advisers_questions
  has_many :questions, :through => :advisers_questions

  attr_accessible :featured, :address, :city, :name, :phone, :rating_id,
                  :state, :url, :zip, :adviser_user_id, :gallery_attributes,
                  :plan, :blog_url, :verified, :years_of_experience,
                  :short_description, :education, :years_of_experience, :company_data, :bio,
                  :experience, :offers_and_pledges, :compensation_arrangements, :email,
                  :advisers_questions_attributes

  accepts_nested_attributes_for :advisers_questions,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  paginates_per 15

  accepts_nested_attributes_for :gallery,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  before_create :set_rating

  def self.sort_by(sort_type_params, sortable_params)
    if sort_type_params == 'Name'
      sort_type = 'name'
    elsif sort_type_params == 'Address'
      sort_type = 'address'
    elsif sort_type_params == 'Rating'
      sort_type = 'rating_id'
    else
      sort_type = 'rating_id'
    end

    if sortable_params == 'ASC'
      sortable = 'ASC'
    else
      sortable = 'DESC'
    end

    order("advisers.#{sort_type} #{sortable}")
  end



  def avatar
    self.gallery ? self.gallery.photo.url(:for_gallery) : "/assets/no_avatar.jpg"
  end

  def avator
    avatar()
  end

  def set_rating
    self.rating = Rating.find_or_create_by_name('C')
  end

  def splitted(relation)
    html = ''
    rln = self.try(relation)
    unless rln.blank?
      rln.split(/\n/).each do |line|
        html << '<li>'+ line + '</li>'
      end
    end
    html
  end
end
