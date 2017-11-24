require 'rails_helper'

describe "log in", :type => :feature do
  let(:user) { build :user, email: "current@user.com" , password: 'password'}
  let(:another_user) { build :user, email: "another@user.com" }
  let(:profile) { build :profile, first_name: "Robin " ,last_name: "Hood", role: "admin"}
  let(:another_profile) { build :profile, first_name: "Jesse" ,last_name: "Jay", role: "student" }
it "allows a user to login" do
  visit root_path

  fill_in 'Email', with: 'current@user.com'
  fill_in 'Password', with: 'password'
  click_on 'Log in'

 end
end
