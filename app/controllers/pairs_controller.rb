class PairsController < ApplicationController

	def index
		set_students_array
		@schedule = Pairing.new(@students).days
	end

	def create
	end

	private

	def pairs_params
		params.require(:pair).permit(:day, :pairs)

	end

	def set_students_array
		@students = []
		profiles = Profile.all
		profiles.each do |profile|
				@students <<  profile.first_name if profile.role == "student"
		end
	end

end
