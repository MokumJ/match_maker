class Profile < ApplicationRecord
  belongs_to :user

	def full_name
		"#{first_name} #{last_name}"
	end

	def self.select_students_from_profiles
	  @students = where(role: "student")
	end
	
end
