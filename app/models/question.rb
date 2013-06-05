class Question < ActiveRecord::Base
  attr_accessible :body, :faq
  has_many :advisers_questions
  has_many :advisers, :through => :advisers_questions
end
