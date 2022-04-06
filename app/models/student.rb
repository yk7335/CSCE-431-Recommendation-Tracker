# frozen_string_literal: true

class Student < ApplicationRecord
  has_one :image
  has_many :course
  # csv upload
  def self.import(file, year, semester, files, classn)
    i = 0
    # sort images

    # create course if not already created?
    check = false
    if Course.all.count < 1
      logger.info "\n\n HERE1 \n\n"
      @Courses.each do |_course|
        if @course.classname == classn && @course.semester == semester && @course.year == year
          check = true
          logger.info "\n\n HERE2 \n\n"
        end
      end
    end

    if not(check)
      course_hash = Course.new
      course_hash.classname = classn
      course_hash.semester = semester
      course_hash.year = year
      course_hash.save
    end

    CSV.foreach(file, headers: true) do |row|
      # create the image instance for each student
      image_hash = Image.new
      image_hash.uin = row[3]
      image_hash.photo.attach(files[i])
      i += 1
      image_hash.save

      # create the student for each csv entry
      student_hash = Student.new
      student_hash.lastname = row[0]
      student_hash.firstname = row[1]
      student_hash.uin = row[3]
      student_hash.email = row[5]
      student_hash.classname = classn
      student_hash.notes = row[8]
      student_hash.major = row[9]
      student_hash.finalgrade = row[14]
      student_hash.updatedgrade = row[15]
      student_hash.recletter = 'undecided'
      student_hash.semester = semester.to_s
      student_hash.year = year
      student_hash.save
    end
    # redirect_to students_path, notice: "Students Imported Successfully"
  end

  # validates :email, presence: true
  # validates :firstname, presence: true
  # validates :lastname, presence: true
  # validates :notes, presence: true
  # validates :uin, presence: true
  # validates :major, presence: true
  # validates :finalgrade, presence: true
  # validates :updatedgrade, presence: true
  # validates :classname, presence: true
  # validates :recletter, presence: true
  # validates :semester, presence: true
  # validates :year, presence: true
end
