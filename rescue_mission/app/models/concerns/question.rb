class Question <ActiveRecord::Base

  validates :title, presence: true
  validates_length_of :title, minimum: 40, message: "can't be less than 40 characters"
  validates :description, presence: true
  validates_length_of :description, minimum: 150, message: "must be at least 150 characters"

end
