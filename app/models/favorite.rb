class Favorite < ApplicationRecord
    has_many :student
    validates :email, presence: true
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :notes, presence: true
    validates :uin, presence: true
    validates :finalgrade, presence: true
    validates :updatedgrade, presence: true
    validates :classname, presence: true
    validates :recletter, presence: true
    validates :semester, presence: true
    validates :year, presence: true
end
