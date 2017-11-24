require 'rails_helper'
  def log_in(email, password)
    visit root_path

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Log in'
  end
feature  "change to student" do




scenario "clicks on make student" do

  @user = FactoryGirl.create(:user, email: "jesja123@gmail.com", password: 'password')
  profile = FactoryGirl.create(:profile, first_name: "Robin", last_name: "Hood", role: "student", user: @user)
visit root_path
 log_in("jesja123@gmail.com", 'password')

  find('#navbar').click
  click_on 'User list'
   visit profiles_path

     expect(page).to have_text( "Robin  Hood")
     expect(page).to have_text("student")


end
end
