class PairsController < ApplicationController

	def index
		@pairs = Pair.make_pairs
	end
end
