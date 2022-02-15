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


RSpec.describe 'Creating a student', type: :feature do
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

   end
 end

#
# COMMAND TO RUN : rspec spec/feature/integration_spec.rb

# have to go to app/model/user.rb to validate the feilds

# This doc is the TDD on canvas : https://docs.google.com/document/d/1mS5kiGjjqbpg_ckmAx3RkvkS8a--MjqN/edit