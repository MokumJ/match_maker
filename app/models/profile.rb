class Profile < ApplicationRecord
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end

	def self.select_students_from_profiles
	  @students = where(role: "student")
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
