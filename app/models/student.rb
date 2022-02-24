class Student < ApplicationRecord
    validates :email, presence: true
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :notes, presence: true
    validates :uin, presence: true
    validates :major, presence: true
    validates :finalgrade, presence: true
    validates :updatedgrade, presence: true
end
