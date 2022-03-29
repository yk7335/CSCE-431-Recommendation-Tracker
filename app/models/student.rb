# frozen_string_literal: true
class Student < ApplicationRecord
  has_one :image
  # csv upload
  def self.import(file, year, semester, files)
    # files.each do |f|
    #   image_hash = Image.new
    #   # need to access the temprary data and get the (#)+1's uin 
    #   image_hash.uin = (f.original_filename.to_s)[0..-5]
    #   image_hash.photo.attach(f)
    #   image_hash.save
    #end
      i = 0    
      CSV.foreach(file, headers: true) do |row|
        image_hash = Image.new
        # need to access the temprary data and get the (#)+1's uin 
        image_hash.uin = row[3]
        image_hash.photo.attach(files[i])
        i = i + 1
        image_hash.save


        student_hash = Student.new
        student_hash.lastname = row[0]
        student_hash.firstname = row[1]
        student_hash.uin = row[3]
        student_hash.email = row[5]
        student_hash.classname = row[7]
        student_hash.notes = row[8]
        student_hash.major = row[9]
        student_hash.finalgrade = row[14]
        student_hash.updatedgrade = row[15]
        student_hash.recletter = "undecided"
        student_hash.semester = semester.to_s
        student_hash.year = year
        student_hash.save
      end
      #redirect_to students_path, notice: "Students Imported Successfully"
  end

  #validates :email, presence: true
  #validates :firstname, presence: true
  #validates :lastname, presence: true
  #validates :notes, presence: true
  #validates :uin, presence: true
  #validates :major, presence: true
  #validates :finalgrade, presence: true
  #validates :updatedgrade, presence: true
  #validates :classname, presence: true
  #validates :recletter, presence: true
  #validates :semester, presence: true
  #validates :year, presence: true
end
