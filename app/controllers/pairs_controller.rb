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
		# byebug
	end

	private

	def pairs_params
		params.require(:pair).permit(:day, :pairs)

	end

	def set_students_array
		@students = []
		profiles = Profile.all
		profiles.each do |profile|
				@students <<  profile.partial_full_name if profile.role == "student"
		end
	end

end
