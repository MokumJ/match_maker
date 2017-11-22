class PairsController < ApplicationController
	attr_reader :days

	def initialize_students(days)
	 @days = {}
	 seed_students
	end
	def index
		set_students_array

		@schedule = Pairing.new(@students).days
r
	end

	def create
	end

	private

	def pairs_params
		params.require(:pair).permit(:day, :pairs)

	end


	attr_reader :days

 def initialize_students(days)
   @days = {}
   seed_students
 end

 private

 def seed_students
   @students.push(nil) if @students.size.odd?
   @days = @students.size - 1
   pairs_per_day = @students.size / 2
   @days.times do |index|
     @days[index+1] = []
     pairs_per_day.times do |pair_index|
       @days[index+1] << [@students[pair_index], @students.reverse[pair_index]]
     end
     @students = [@students[0]] + @students[1..-1].rotate(-1)
   end

 end
end
	def set_students_array
		@students = []
		profiles = Profile.all
		profiles.each do |profile|
				@students <<  profile.first_name if profile.role == "student"
		end
	end



end

