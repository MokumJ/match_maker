class Profile < ApplicationRecord
  belongs_to :user

	def full_name
		"#{first_name} #{last_name}"
	end

	def set_students_array
		@students = []
		profiles = Profile.all
		profiles.each do |profile|
				@students <<  profile.first_name if profile.role == "student"
		end
	end

end
