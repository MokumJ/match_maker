class PairsController < ApplicationController
		before_action :set_students_array

	def index
		@pairs_schedule = Pair.all
	end

	def create
		save_into_db
		redirect_to pairs_path
	end

	def save_into_db
		Pair.all.where("day >= :today", today: Date.today ).destroy_all
		set_students_array
		@students = @students.shuffle

		@schedule = Pairing.new(@students).days
		@schedule.each do |day, pairs|
			Pair.create!(day: Date.today + day, pairs: pairs)
		end
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
