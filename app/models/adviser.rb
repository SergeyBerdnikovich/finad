class Adviser < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged


  attr_accessible :featured, :address, :city, :name, :phone, :rating, :state, :url, :zip, :adviser_user_id, :gallery_attributes, :plan

  paginates_per 15

  has_one :gallery, :dependent => :destroy
  belongs_to :adviser_user

  accepts_nested_attributes_for :gallery,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def self.sort_by(sort_type_params, sortable_params)
    if sort_type_params == 'Name'
      sort_type = 'name'
    elsif sort_type_params == 'Address'
      sort_type = 'address'
    elsif sort_type_params == 'Rating'
      sort_type = 'rating'
    else
      sort_type = 'rating'
    end

    if sortable_params == 'ASC'
      sortable = 'ASC'
    else
      sortable = 'DESC'
    end

    order("advisers.#{sort_type} #{sortable}")
  end

  def avator
    self.gallery ? self.gallery.photo.url(:for_gallery) : "/assets/no_avatar.jpg"
  end
end
