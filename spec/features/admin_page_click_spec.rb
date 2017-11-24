require 'rails_helper'
  def log_in
    visit root_path
    click_on 'Sign up'
    fill_in 'Email', with: 'current@user.com'
    fill_in 'Password', with: 'password'
    click_on 'Log in'
  end
feature  "change to student" do

  let(:user) { build :user, email: "current@user.com" , password: 'password'}
  let(:another_user) { build :user, email: "another@user.com" }
  let(:profile) { build :profile, first_name: "Robin " ,last_name: "Hood", role: "admin"}
  let(:another_profile) { build :profile, first_name: "Jesse" ,last_name: "Jay", role: "student" }

scenario "clicks on make_student" do
  log_in
  print page.html
  find('#navbar').click
  click_on 'User list'
   visit profiles_path
   print page.html
     expect(page).to have_text( "Robin  Hood")
     expect(page).to have_text("user")
end
end
