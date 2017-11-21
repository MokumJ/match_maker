require 'profile.rb'

class Calendar < ApplicationRecord

	def make_pairs
		Profile.select_students_from_profiles
		@pairs = RoundRobinTournament.schedule(@students)
	end

end
