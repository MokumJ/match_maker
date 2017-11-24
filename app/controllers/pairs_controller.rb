class PairsController < ApplicationController

	def index
		@pairs_schedule = Pair.all
	end

	def create
	end

	def save_into_db
		set_students_array
		Pair.all.where("day >= :today", today: Date.today ).destroy_all
															# Destroy data that is from today
		@schedule = Pairing.new(@students.shuffle).days
															# shuffle the array for randomizing the order
		@schedule.each do |day, pairs|
			Pair.create!(day: Date.today + day, pairs: pairs)
		end
		redirect_to pairs_path
	end

	private

	def pairs_params
		params.require(:pair).permit(:day, :pairs)
	end

	def set_students_array
		@students = []									# set students empty array
		profiles = Profile.all 					# Profile.all because we specify
		 																# role in the profile class
		profiles.each do |profile|
				@students <<  profile.full_name if profile.role == "student"
																				# insert each Profile with role
																				# student with full name
		end
	end

end
