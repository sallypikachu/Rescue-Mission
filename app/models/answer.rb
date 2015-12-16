class Answer < ActiveRecord::Base
  belongs_to :question
  validates :question_id, presence: true
  validates :answer, length: { minimum: 50 }
end
