class PairsController < ApplicationController

	def index
		generate_pairs_and_save_into_db
		@pairs = Pair.all
	end

	def generate_pairs_and_save_into_db
		set_students_array
		pairs = round_robin(@students)
		for i in 0...pairs.length
			Pair.create!(day: (Date.today + i), pairs: pairs[i])
		end
	end

	def create
	end

	private

	def pairs_params
		params.require(:pair).permit(:day, :pairs)

	end
	def round_robin(array)
		RoundRobinTournament.schedule(array)
	end

	def set_students_array
		@students = []
		profiles = Profile.all
		profiles.each do |profile|
				@students <<  profile.first_name if profile.role == "student"
		end
	end
end
