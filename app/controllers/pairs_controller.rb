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
		Pair.all.destroy_all
		set_students_array

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
		@students = []
		profiles = Profile.all
		profiles.each do |profile|
				@students <<  profile.full_name if profile.role == "student"
		end
	end

end
