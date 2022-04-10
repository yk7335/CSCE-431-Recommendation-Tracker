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
    fill_in 'student_email', with: 'mihiranpandey@gmail.com'
    fill_in 'student_firstname', with: 'mihiran'
    fill_in 'student_lastname', with: 'pandey'
    fill_in 'student_notes', with: 'is cool'
    fill_in 'student_uin', with: '0000001'
    fill_in 'student_finalgrade', with: 'A'
    fill_in 'student_updatedgrade', with: 'B'
    fill_in 'student_classname', with: 'cs315'
    select "YES", :from => "student_recletter"
    select "Fall", :from => "student_semester"
    fill_in 'student_year', with: '2021'
    click_on 'Create Student'
    visit students_path
    expect(page).to have_content('mihiranpandey@gmail.com')
    expect(page).to have_content('mihiran')
    expect(page).to have_content('pandey')
    expect(page).to have_content('is cool')
    expect(page).to have_content('A')
    expect(page).to have_content('B')
    expect(page).to have_content('0000001')
    expect(page).to have_content('cs315')
    expect(page).to have_content('YES')
    expect(page).to have_content('Fall')
    expect(page).to have_content('2021')
  end
end

# --- Creating student with invalid input -------
RSpec.describe 'Creating a student', type: :feature do
  scenario 'invalid inputs' do
    visit new_student_path
    fill_in 'student_email', with: ''
    fill_in 'student_firstname', with: ''
    fill_in 'student_lastname', with: ''
    fill_in 'student_notes', with: 'is cool'
    fill_in 'student_uin', with: '0000001'
    fill_in 'student_finalgrade', with: 'A'
    fill_in 'student_updatedgrade', with: 'B'
    fill_in 'student_classname', with: 'cs315'
    select "YES", :from => "student_recletter"
    select "Fall", :from => "student_semester"
    fill_in 'student_year', with: '2021'
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
    fill_in 'student_email', with: 'mihiranpandey@gmail.com'
    fill_in 'student_firstname', with: 'mihiran'
    fill_in 'student_lastname', with: 'pandey'
    fill_in 'student_notes', with: 'is cool'
    fill_in 'student_uin', with: '0000001'
    fill_in 'student_finalgrade', with: 'A'
    fill_in 'student_updatedgrade', with: 'B'
    fill_in 'student_classname', with: 'cs315'
    select "YES", :from => "student_recletter"
    select "Fall", :from => "student_semester"
    fill_in 'student_year', with: '2021'
    click_on 'Update Student'
    expect(page).to have_content('mihiranpandey@gmail.com')
    expect(page).to have_content('mihiran')
    expect(page).to have_content('pandey')
    expect(page).to have_content('is cool')
    expect(page).to have_content('A')
    expect(page).to have_content('0000001')
    expect(page).to have_content('cs315')
    expect(page).to have_content('YES')
    expect(page).to have_content('Fall')
    expect(page).to have_content('2021')
  end
end

# ---- Updating a student with invalid inputs ---
RSpec.describe 'Updating a student', type: :feature do
  before do
    student = Student.create(email: "m", email: "m", firstname: "m", lastname: "m", notes: "m", uin: "m", major: "m", finalgrade: "m", updatedgrade: "m", classname: "m", recletter: "m", year: "m", semester: "m")
    visit edit_student_path(student)
  end

  scenario 'invalid inputs' do
    fill_in 'student_email', with: ''
    fill_in 'student_firstname', with: ''
    fill_in 'student_lastname', with: ''
    fill_in 'student_notes', with: 'is cool'
    fill_in 'student_uin', with: '0000001'
    fill_in 'student_finalgrade', with: 'A'
    fill_in 'student_updatedgrade', with: 'B'
    fill_in 'student_classname', with: 'cs315'
    select "YES", :from => "student_recletter"
    select "Fall", :from => "student_semester"
    fill_in 'student_year', with: '2021'
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
    click_on 'Delete'
    expect(page).to have_content("Students")
  end
end

# ---- Uploading csv with valid file -----------
RSpec.describe 'Uploading a csv and images', type: :feature do
    it "Uploads csv file" do
      Student.import(file_fixture("test.csv"), "2021", "Fall", [File.open(Rails.root.join(file_fixture("pfp.jpg")))], "CS315")
      Student.import(file_fixture("test.csv"), "2021", "Fall", [File.open(Rails.root.join(file_fixture("pfp.jpg")))], "CS315")
      visit students_path
      expect(page).to have_content("Washington")
      visit courses_path
      expect(page).to have_content("CS315")
    end
end

# ---- Favoriting students -----------
RSpec.describe 'Uploading a csv and images', type: :feature do
  before "Favorites student" do
    student = Student.create(email: "m", email: "m", firstname: "m", lastname: "m", notes: "m", uin: "m", major: "m", finalgrade: "m", updatedgrade: "m", classname: "m", recletter: "m", year: "m", semester: "m")
    visit students_path
  end

  scenario 'favoriting new student' do
    click_on 'Favorite'
    visit favorites_path
    expect(page).to have_content('m')
  end
end

# --- Creating favorite students ------------
RSpec.describe 'Creating a favorite', type: :feature do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    Admin.create!(email: 'userdoe@example.com', full_name: 'User Doe', uid: '123456789', avatar_url: 'https://lh3.googleusercontent.com/url/photo.jpg')
    visit root_path
  end

  scenario 'valid inputs' do
    visit new_favorite_path
    fill_in 'favorite_email', with: 'mihiranpandey@gmail.com'
    fill_in 'favorite_firstname', with: 'mihiran'
    fill_in 'favorite_lastname', with: 'pandey'
    fill_in 'favorite_notes', with: 'is cool'
    fill_in 'favorite_uin', with: '0000001'
    fill_in 'favorite_finalgrade', with: 'A'
    fill_in 'favorite_updatedgrade', with: 'B'
    fill_in 'favorite_classname', with: 'cs315'
    fill_in 'favorite_recletter', with: 'YES'
    fill_in 'favorite_semester', with: 'Fall'
    fill_in 'favorite_year', with: '2021'
    click_on 'Create Favorite'
    visit favorites_path
    expect(page).to have_content('mihiranpandey@gmail.com')
    expect(page).to have_content('mihiran')
    expect(page).to have_content('pandey')
    expect(page).to have_content('is cool')
    expect(page).to have_content('A')
    expect(page).to have_content('B')
    expect(page).to have_content('0000001')
    expect(page).to have_content('cs315')
    expect(page).to have_content('YES')
    expect(page).to have_content('Fall')
    expect(page).to have_content('2021')
  end

  scenario 'invalid inputs' do 
    visit new_favorite_path
    fill_in 'favorite_email', with: ''
    fill_in 'favorite_firstname', with: ''
    fill_in 'favorite_lastname', with: 'pandey'
    fill_in 'favorite_notes', with: 'is cool'
    fill_in 'favorite_uin', with: '0000001'
    fill_in 'favorite_finalgrade', with: 'A'
    fill_in 'favorite_updatedgrade', with: 'B'
    fill_in 'favorite_classname', with: 'cs315'
    fill_in 'favorite_recletter', with: 'YES'
    fill_in 'favorite_semester', with: 'Fall'
    fill_in 'favorite_year', with: '2021'
    click_on 'Create Favorite'
    expect(page).to have_content("can't be blank")
  end
end


# --- Updating favorite students ------------
RSpec.describe 'Updating a favorite', type: :feature do
  before do
    favorite = Favorite.create(email: "m", email: "m", firstname: "m", lastname: "m", notes: "m", uin: "m", major: "m", finalgrade: "m", updatedgrade: "m", classname: "m", recletter: "m", year: "m", semester: "m")
    visit edit_favorite_path(favorite)
  end

  scenario 'valid inputs' do
    fill_in 'favorite_email', with: 'mihiranpandey@gmail.com'
    fill_in 'favorite_firstname', with: 'mihiran'
    fill_in 'favorite_lastname', with: 'pandey'
    fill_in 'favorite_notes', with: 'is cool'
    fill_in 'favorite_uin', with: '0000001'
    fill_in 'favorite_finalgrade', with: 'A'
    fill_in 'favorite_updatedgrade', with: 'B'
    fill_in 'favorite_classname', with: 'cs315'
    fill_in 'favorite_recletter', with: 'YES'
    fill_in 'favorite_semester', with: 'Fall'
    fill_in 'favorite_year', with: '2021'
    click_on 'Update Favorite'
    expect(page).to have_content('mihiranpandey@gmail.com')
    expect(page).to have_content('mihiran')
    expect(page).to have_content('pandey')
    expect(page).to have_content('is cool')
    expect(page).to have_content('A')
    expect(page).to have_content('0000001')
    expect(page).to have_content('cs315')
    expect(page).to have_content('YES')
    expect(page).to have_content('Fall')
    expect(page).to have_content('2021')
  end

  scenario 'invalid inputs' do
    favorite = Favorite.create(email: "m", email: "m", firstname: "m", lastname: "m", notes: "m", uin: "m", major: "m", finalgrade: "m", updatedgrade: "m", classname: "m", recletter: "m", year: "m", semester: "m")
    visit edit_favorite_path(favorite) 
    fill_in 'favorite_email', with: ''
    fill_in 'favorite_firstname', with: 'mihiran'
    fill_in 'favorite_lastname', with: 'pandey'
    fill_in 'favorite_notes', with: 'is cool'
    fill_in 'favorite_uin', with: '0000001'
    fill_in 'favorite_finalgrade', with: 'A'
    fill_in 'favorite_updatedgrade', with: 'B'
    fill_in 'favorite_classname', with: 'cs315'
    fill_in 'favorite_recletter', with: 'YES'
    fill_in 'favorite_semester', with: 'Fall'
    fill_in 'favorite_year', with: '2021'
    click_on 'Update Favorite'
    expect(page).to have_content("can't be blank")
  end
end

# --- Deleting favorite students ------------
RSpec.describe 'Deleting a favorite', type: :feature do
  before do
    favorite = Favorite.create(email: "m", email: "m", firstname: "m", lastname: "m", notes: "m", uin: "m", major: "m", finalgrade: "m", updatedgrade: "m", classname: "m", recletter: "m", year: "m", semester: "m")
    visit favorites_path
  end

  scenario 'deleting a favorite' do
    click_on 'Destroy'
    expect(page).to have_content("successfully")
  end
end

# --- Creating Courses ------------
RSpec.describe 'Creating a Course', type: :feature do
  before do
    course = Course.create(classname: "m", year: "m", semester: "m")
    visit edit_course_path(course)
  end

  scenario 'valid inputs' do
    fill_in 'course_classname', with: 'cs315'
    fill_in 'course_semester', with: 'Fall'
    fill_in 'course_year', with: '2021'
    click_on 'Update Course'
    visit courses_path
    expect(page).to have_content('cs315')
    expect(page).to have_content('Fall')
    expect(page).to have_content('2021')
  end

  scenario 'invalid inputs' do
    course = Course.create(classname: "m", year: "m", semester: "m")
    visit edit_course_path(course)
    fill_in 'course_classname', with: ''
    fill_in 'course_semester', with: ''
    fill_in 'course_year', with: '2021'
    click_on 'Update Course'
    expect(page).to have_content("can't be blank")
  end
end

# --- Updating Courses ------------
RSpec.describe 'Updating a Course', type: :feature do
  before do
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_user]
    Admin.create!(email: 'userdoe@example.com', full_name: 'User Doe', uid: '123456789', avatar_url: 'https://lh3.googleusercontent.com/url/photo.jpg')
    visit root_path
  end

  scenario 'valid inputs' do
    visit new_course_path
    fill_in 'course_classname', with: 'cs315'
    fill_in 'course_semester', with: 'Fall'
    fill_in 'course_year', with: '2021'
    click_on 'Create Course'
    visit courses_path
    expect(page).to have_content('cs315')
    expect(page).to have_content('Fall')
    expect(page).to have_content('2021')
  end

  scenario 'invalid inputs' do
    visit new_course_path
    fill_in 'course_classname', with: ''
    fill_in 'course_semester', with: ''
    fill_in 'course_year', with: '2021'
    click_on 'Create Course'
    expect(page).to have_content("can't be blank")
  end
end

# COMMAND TO RUN : rspec spec/feature/integration_spec.rb

# have to go to app/model/user.rb to validate the feilds

# This doc is the TDD on canvas : https://docs.google.com/document/d/1mS5kiGjjqbpg_ckmAx3RkvkS8a--MjqN/edit
