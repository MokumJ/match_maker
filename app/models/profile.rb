class Profile < ApplicationRecord
  belongs_to :user
	validates_presence_of :first_name, :last_name, :role, :user

	def full_name
    "#{first_name} #{last_name}"
	end

	def partial_full_name
		"#{first_name} #{last_name[0]}."
	end

	def make_admin
	  profile = Profile.find params[:id]
	  profile.update( :role => "admin" )
	  redirect_to profiles_url
	end

	def make_student
	  profile = Profile.find params[:id]
	  profile.update( :role => "student" )
	  redirect_to profiles_url
	end
end
