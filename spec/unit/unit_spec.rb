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

    described_class.destroy(email: 'mihiranpandey@gmail.com', firstname: 'mihiran', lastname: 'pandey',
                          notes: 'very cool guy', uin: '100000', major: 'cs', finalgrade: 'A', updatedgrade: 'C',
                          classname: 'cs315', recletter: 'yes', year: '2021' , semester: 'Fall')
    expect(subject).to eq(false)
  end
end
# ------------------------------------



# Command to run: rspec spec/unit/unit_spec.rb               to run both         rails spec .
# here is the doc again: https://docs.google.com/document/d/1mS5kiGjjqbpg_ckmAx3RkvkS8a--MjqN/edit
