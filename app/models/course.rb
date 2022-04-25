class Course < ApplicationRecord
  has_many :student

  def self.delc(classname, semester, year)
    Student.all.where(classname: classname, semester: semester, year: year).find_each do |student|
      student.destroy
    end
      Course.all.find_by(classname: classname, semester: semester, year: year.to_s).destroy
    # if Favorite.all.where(uin: uin).find_each.count < 1
    #   favorite_hash = Favorite.new
    #   favorite_hash.lastname =  lastname
    #   favorite_hash.firstname =  firstname
    #   favorite_hash.uin = uin
    #   favorite_hash.email = email
    #   favorite_hash.classname = classname
    #   favorite_hash.notes =  notes
    #   favorite_hash.major = major
    #   favorite_hash.finalgrade =  finalgrade
    #   favorite_hash.updatedgrade = updatedgrade
    #   favorite_hash.recletter = recletter
    #   favorite_hash.semester = semester
    #   favorite_hash.year = year
    #   favorite_hash.save
    # else
    #   Favorite.all.find_by(uin: uin).destroy
    # end
  end
end
