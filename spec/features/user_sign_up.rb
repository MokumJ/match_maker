
require 'rails_helper'

describe "Signing Up", :type => :feature do
it "allows a user to sign up" do
 visit root_path



 expect(page).to have_content 'Sign up'
 click_on 'Sign up'
visit new_user_registration_path

   fill_in 'Email', with: 'user@example.com'
   fill_in 'Password', with: 'password'
   fill_in 'Password confirmation', with: 'password'

 click_button 'Sign up'
 expect(page).to have_content 'Welcome! You have signed up successfully.'
 expect(page).to have_content 'user@example.com'
 end
end
