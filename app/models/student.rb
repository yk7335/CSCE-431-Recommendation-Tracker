# frozen_string_literal: true
class Student < ApplicationRecord
  has_one_attached :student_images
  # csv upload
  def self.import(file, year, semester)
    CSV.foreach(file.path, headers: true) do |row|
        student_hash = Student.new
        student_hash.lastname = row[0]
        student_hash.firstname = row[1]
        student_hash.uin = row[3]
        student_hash.email = row[5]
        student_hash.classname = row[7]
        student_hash.notes = "THIS IS TESTING"
        student_hash.major = row[9]
        student_hash.finalgrade = row[14]
        student_hash.updatedgrade = row[15]
        student_hash.recletter = "undecided"
        student_hash.semester = semester.to_s
        student_hash.year = year
        student_hash.save
    end
  end


  # validates :email, presence: true
  # validates :firstname, presence: true
  # validates :lastname, presence: true
  # validates :notes, presence: true
  # validates :uin, presence: true
  # validates :major, presence: true
  # validates :finalgrade, presence: true
  # validates :updatedgrade, presence: true
end
