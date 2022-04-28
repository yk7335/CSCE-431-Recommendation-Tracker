class Course < ApplicationRecord
  has_many :student
  def self.delc(classname, semester, year)
    Student.all.where(classname: classname, semester: semester, year: year).find_each do |student|
      Image.all.where(uin: student.uin).find_each do |image|
        image.destroy
      end
      student.destroy
    end
      Course.all.find_by(classname: classname, semester: semester, year: year.to_s).destroy
  end
end

