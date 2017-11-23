class Pairing
	attr_reader :days

	def initialize(students)
		@days = {}
		pairing(students)
	end

	private

	def pairing(students)
		students.push("No partner today!") if students.size.odd?		#adds one more value if we have odd number of student
		days = students.size - 1
		pairs_of_the_day = students.size / 2
		days.times do |key|
			@days[key] = []
			pairs_of_the_day.times do |day_index|
				@days[key] << [students[day_index], students.reverse[day_index]]
			end
			students = [students[0]] + students[1..-1].rotate(-1)
		end
	end
end
