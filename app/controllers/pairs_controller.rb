class PairsController < ApplicationController

	def index
		set_students_array
		@pairs = RoundRobinTournament.schedule(@students)
	end


	def set_students_array
		@students = []
		profiles = Profile.all
		profiles.each do |profile|
				@students <<  profile.first_name if profile.role == "student"
		end
	end
end
