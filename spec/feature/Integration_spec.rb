# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'

# Example of Integration test

# RSpec.describe 'Creating a book', type: :feature do
#    scenario 'valid inputs' do
#      visit new_book_path
#      fill_in 'Title', with: 'harry potter'
#      click_on 'Create Book'
#      visit books_path
#      expect(page).to have_content('harry potter')
#    end
#  end

# --- Integration test for students ---
RSpec.describe('Authentication', type: :feature) do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    Admin.create!(email: 'userdoe@example.com', full_name: 'User Doe', uid: '123456789', avatar_url: 'https://lh3.googleusercontent.com/url/photo.jpg')
  end

  it 'log in successful' do
    visit root_path
  end
end

# ---- Creating student with valid input -----
RSpec.describe 'Creating a student', type: :feature do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    Admin.create!(email: 'userdoe@example.com', full_name: 'User Doe', uid: '123456789', avatar_url: 'https://lh3.googleusercontent.com/url/photo.jpg')
    visit root_path
  end

  scenario 'valid inputs' do
    visit new_student_path
    fill_in 'Email', with: 'mihiranpandey@gmail.com'
    fill_in 'Firstname', with: 'mihiran'
    fill_in 'Lastname', with: 'pandey'
    fill_in 'Notes', with: 'is cool'
    fill_in 'Uin', with: '0000001'
    fill_in 'Major', with: 'cs'
    fill_in 'Finalgrade', with: '100.0'
    fill_in 'Updatedgrade', with: '99.9'
    fill_in 'Classname', with: 'cs315'
    fill_in 'Recletter', with: 'yes'
    fill_in 'Semester', with: 'fall'
    fill_in 'Year', with: '2021'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('mihiranpandey@gmail.com')
    expect(page).to have_content('mihiran')
    expect(page).to have_content('pandey')
    expect(page).to have_content('is cool')
    expect(page).to have_content('cs')
    expect(page).to have_content('100.0')
    expect(page).to have_content('99.9')
    expect(page).to have_content('0000001')
    expect(page).to have_content('cs315')
    expect(page).to have_content('yes')
    expect(page).to have_content('fall')
    expect(page).to have_content('2021')
  end
end

# --- Creating student with invalid input -------
RSpec.describe 'Creating a student', type: :feature do
  scenario 'invalid inputs' do
    visit new_student_path
    fill_in 'Email', with: ''
    fill_in 'Firstname', with: ''
    fill_in 'Lastname', with: ''
    fill_in 'Notes', with: 'is cool'
    fill_in 'Uin', with: '0000001'
    fill_in 'Major', with: 14
    fill_in 'Finalgrade', with: '100.0'
    fill_in 'Updatedgrade', with: '99.9'
    fill_in 'Classname', with: 'cs315'
    fill_in 'Recletter', with: 'yes'
    fill_in 'Semester', with: 'fall'
    fill_in 'Year', with: '2021'
    click_on 'Create Student'
    expect(page).to have_content("can't be blank")
  end
end

# ----- Updating a Student with valid input --------
RSpec.describe 'Updating a student', type: :feature do
  before do
    student = Student.create(email: "m", email: "m", firstname: "m", lastname: "m", notes: "m", uin: "m", major: "m", finalgrade: "m", updatedgrade: "m", classname: "m", recletter: "m", year: "m", semester: "m")
    visit edit_student_path(student)
  end

  scenario 'valid inputs' do
    fill_in 'Email', with: 'mihiranpandey@gmail.com'
    fill_in 'Firstname', with: 'mihiran'
    fill_in 'Lastname', with: 'pandey'
    fill_in 'Notes', with: 'is cool'
    fill_in 'Uin', with: '0000001'
    fill_in 'Major', with: 'cs'
    fill_in 'Finalgrade', with: '100.0'
    fill_in 'Updatedgrade', with: '99.9'
    fill_in 'Classname', with: 'cs315'
    fill_in 'Recletter', with: 'yes'
    fill_in 'Semester', with: 'fall'
    fill_in 'Year', with: '2021'
    click_on 'Update Student'
    expect(page).to have_content('mihiranpandey@gmail.com')
    expect(page).to have_content('mihiran')
    expect(page).to have_content('pandey')
    expect(page).to have_content('is cool')
    expect(page).to have_content('cs')
    expect(page).to have_content('100.0')
    expect(page).to have_content('99.9')
    expect(page).to have_content('0000001')
    expect(page).to have_content('cs315')
    expect(page).to have_content('yes')
    expect(page).to have_content('fall')
    expect(page).to have_content('2021')
  end
end

# ---- Updating a student with invalid inputs ---
RSpec.describe 'Updating a student', type: :feature do
  before do
    student = Student.create(email: "m", email: "m", firstname: "m", lastname: "m", notes: "m", uin: "m", major: "m", finalgrade: "m", updatedgrade: "m", classname: "m", recletter: "m", year: "m", semester: "m")
    visit edit_student_path(student)
  end

  scenario 'valid inputs' do
    fill_in 'Email', with: ''
    fill_in 'Firstname', with: ''
    fill_in 'Lastname', with: ''
    fill_in 'Notes', with: ''
    fill_in 'Uin', with: ''
    fill_in 'Major', with: ''
    fill_in 'Finalgrade', with: ''
    fill_in 'Updatedgrade', with: ''
    fill_in 'Classname', with: ''
    fill_in 'Recletter', with: ''
    fill_in 'Semester', with: ''
    fill_in 'Year', with: ''
    click_on 'Update Student'
    expect(page).to have_content("can't be blank")
  end
end

# ---- Integration test for deleting a student ----
RSpec.describe 'Deleting a student', type: :feature do
  before do
    student = Student.create(email: "m", email: "m", firstname: "m", lastname: "m", notes: "m", uin: "m", major: "m", finalgrade: "m", updatedgrade: "m", classname: "m", recletter: "m", year: "m", semester: "m")
    visit students_path
  end

  scenario 'deleting a student' do
    click_on 'Destroy'
    expect(page).to have_content("successful")
  end
end

# ---- Uploading csv with valid file -----------
RSpec.describe 'Uploading a csv', type: :feature do
    it "Uploads csv file" do
      Student.import(file_fixture("test.csv"), "2021", "Fall")
      visit students_path
      expect(page).to have_content("Washington")
    end
end

# ---- Uploading image file -----------------
RSpec.describe 'Uploading an image', type: :feature do
  it "Uploads image file" do
    Image.import(file_fixture("P47.jpg"))
    visit images_path
    expect(page).to have_content("P47")
  end
end
#
# COMMAND TO RUN : rspec spec/feature/integration_spec.rb

# have to go to app/model/user.rb to validate the feilds

# This doc is the TDD on canvas : https://docs.google.com/document/d/1mS5kiGjjqbpg_ckmAx3RkvkS8a--MjqN/edit
