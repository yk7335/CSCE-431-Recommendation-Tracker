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
                        notes: 'very cool guy', uin: '100000', major: 'cs', finalgrade: 'A', updatedgrade: 'C')
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
    expect(subject).not_to be_valid
  end
end
# ------------------------------------

# Command to run: rspec spec/unit/unit_spec.rb               to run both         rails spec .
# here is the doc again: https://docs.google.com/document/d/1mS5kiGjjqbpg_ckmAx3RkvkS8a--MjqN/edit
