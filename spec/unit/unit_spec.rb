# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

# RSpec.describe Book, type: :model do
#  subject do
#    described_class.new(title: 'harry potter')
#  end

#  it 'is valid with valid attributes' do
#    expect(subject).to be_valid
#  end

#  it 'is not valid without a name' do
#    subject.title = nil
#    expect(subject).not_to be_valid
#  end
# end

# ---Unit test for adding a student---
RSpec.describe Student, type: :model do
  subject do
    described_class.new(email: 'mihiranpandey@gmail.com', firstname: 'mihiran', lastname: 'pandey',
                        notes: 'very cool guy', uin: '100000', major: 'cs', finalgrade: 'A', updatedgrade: 'C',
                        classname: 'cs315', recletter: 'yes', year: '2021' , semester: 'Fall')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.email = nil
    subject.firstname = nil
    subject.lastname = nil
    subject.notes = nil
    subject.uin = nil
    subject.major = nil
    subject.finalgrade = nil
    subject.updatedgrade = nil
    subject.classname = nil
    subject.recletter = nil
    subject.year = nil
    subject.semester = nil
    expect(subject).not_to be_valid
  end

  it 'is valid with different types than expected' do
    subject.email = "4".to_i
    subject.firstname = "4".to_i
    subject.lastname = "4".to_i
    subject.notes = "4".to_i
    subject.uin = "this should be a number"
    subject.major = "4".to_i
    subject.finalgrade = "this should be a number"
    subject.updatedgrade = "this should be a number"
    subject.classname = "4".to_i
    subject.recletter = "4".to_i
    subject.year = "this should be a number"
    subject.semester = "4".to_i
    expect(subject).to be_valid
  end
end

# ------ Unit test for updating a student --------
RSpec.describe Student, type: :model do
  subject do
    described_class.new(email: 'mihiranpandey@gmail.com', firstname: 'mihiran', lastname: 'pandey',
                        notes: 'very cool guy', uin: '100000', major: 'cs', finalgrade: 'A', updatedgrade: 'C',
                        classname: 'cs315', recletter: 'yes', year: '2021' , semester: 'Fall')
  end

  it 'updates student correctly' do
    subject do
      subject.update(email: 'mihiran@gmail.com', firstname: 'pandey', lastname: 'cooldude',
                             notes: 'kinda a scumbag', uin: '2', major: 'csce', finalgrade: 'A', updatedgrade: 'C',
                             classname: 'cs315', recletter: 'yes', year: '2021' , semester: 'Fall')
      expect(subject).to be_valid
    end
  end

  it 'is invalid when updating' do
    subject do
      subject.update(email: nil, firstname: 'pandey', lastname: 'cooldude',
                     notes: 'kinda a scumbag', uin: '2', major: 'csce', finalgrade: 'A', updatedgrade: 'C',
                     classname: 'cs315', recletter: 'yes', year: '2021' , semester: 'Fall')
      expect(subject).to be_valid
    end
  end
end

# ---- unit test for deleting a student ----
RSpec.describe Student, type: :model do
  subject do
    described_class.new(email: 'mihiranpandey@gmail.com', firstname: 'mihiran', lastname: 'pandey',
                          notes: 'very cool guy', uin: '100000', major: 'cs', finalgrade: 'A', updatedgrade: 'C',
                          classname: 'cs315', recletter: 'yes', year: '2021' , semester: 'Fall')

    described_class.destroy()
    
    expect(subject).to eq(false)
  end
end

# ------------- unit test for import func -----------
RSpec.describe Student, type: :feature do
  subject do
    described_class.import(file_fixture("test.csv"),"2021", "Fall", [File.open(Rails.root.join(file_fixture("pfp.jpg")))], "CS315")
  end
  
    it 'imports properly' do
      expect(subject).to eq(240)
    end
end

# ------------ unit test for favorite student --------
RSpec.describe Student, type: :feature do
  subject do
    described_class.favor('mihiranpandey@gmail.com', 'mihiran', 'pandey', 'is cool', 'cs' , '0000001', 'A', 'B', 'cs315', 'YES', 'Fall', '2021')
  end
  
  it 'is valid' do
    expect(subject).to eq(true)
  end
end

# -------------- unit test for creating course ---------
RSpec.describe Course, type: :model do
  subject do
    described_class.new(classname: 'cs315', semester: 'Fall', year: '2022')
  end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
end
# --------------------------------------------------------

# -------------- unit test for deleting course ------------
RSpec.describe Course, type: :model do
  subject do
    described_class.new(classname: 'cs315', semester: 'Fall', year: '2022')
    described_class.destroy(classname: 'cs315', semester: 'Fall', year: '2022')
    expect(subject).to eq(false)
  end
end
# ---------------------------------------------------------

# ------------ unit test for favorite student --------
RSpec.describe Favorite, type: :model do
  subject do
    described_class.new(email: 'mihiranpandey@gmail.com', firstname: 'mihiran', lastname: 'pandey', notes: 'is cool', major: 'cs' , uin: '0000001', finalgrade: 'A', updatedgrade: 'B', classname: 'cs315', recletter: 'YES', semester: 'Fall', year: '2021')
  end
  
  it 'is valid' do
    expect(subject).to be_valid
  end
end
# -----------------------------------------------------

# Command to run: rspec spec/unit/unit_spec.rb               to run both         rails spec .
# here is the doc again: https://docs.google.com/document/d/1mS5kiGjjqbpg_ckmAx3RkvkS8a--MjqN/edit
