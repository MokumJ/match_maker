require 'rails_helper'

describe "Current profile viewing the list of profiles" do
  before { create profile }

  let(:admin) { create :profile, first_name: 'robin', last_name: 'doe', role: 'admin' }
  let(:student)  { create :profile, first_name: 'jesse', last_name: 'doe', role: 'student' }



  it "shows all users" do
    visit profiles_url

    expect(page).to have_text( "admin")
    expect(page).to have_text("student")
  end
end
