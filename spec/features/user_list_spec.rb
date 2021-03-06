require 'rails_helper'
def sign_in
  visit root_path
  click_on 'Sign up'
 visit new_user_registration_path

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
  end
def create_profiles
 find('#navbar').click
 click_on 'Create Profile'
 fill_in 'First Name', with: 'Robin'
 fill_in 'Last Name', with: 'Hood'
 click_button "Save"
end

describe "show list of users" do

it "creates profile" do
    sign_in
    create_profiles

   find('#navbar').click
   click_on 'User list'
    visit profiles_path

    expect(page).to have_text( "Robin  Hood")
    expect(page).to have_text("user")

    end
  end
