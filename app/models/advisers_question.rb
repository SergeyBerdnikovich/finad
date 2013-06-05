class AdvisersQuestion < ActiveRecord::Base
  attr_accessible :adviser_id, :answer, :question_id
  belongs_to :adviser
  belongs_to :question
end
