require "profile.rb"

class Pair < ApplicationRecord

	def self.make_pairs
		Profile.select_students_from_profiles
		@pairs = RoundRobinTournament.schedule(@students)
	end
end
