FactoryGirl.define do
  factory :user do
    email    { Faker::Internet.email }
    password { Faker::Internet.password }

  end


Factory.define :user do |u|
  u.login "test"
  u.after_build { |a| Factory(:profile, :user => a)}
 end
end
