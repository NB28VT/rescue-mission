class Answer < ActiveRecord::Base
  belongs_to :question
  validates :description, presence: true
  validates_length_of :description, minimum: 50, message: "can't be less than 50 characters"
end
