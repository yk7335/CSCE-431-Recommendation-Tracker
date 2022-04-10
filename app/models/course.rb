class Course < ApplicationRecord
  has_many :student

  validates :classname, presence: true
  validates :semester, presence: true
  validates :year, presence: true
end
