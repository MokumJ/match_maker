class Pairing
	attr_reader :days

	def initialize(students)
		@days = {}
		pairing(students)
	end

	private

	def pairing(students)																			# pass in the argument of array students
		students.push("*RUBBER DUCK*") if students.size.odd?		#adds one more element("*RUBBER DUCK*") to students array if we have odd number of student
		days = students.size - 1																# number of times round-robin rotates until reaching the original position
		pairs_of_the_day = students.size / 2										# number of unique possible pairs for each day
		days.times do |key|
			@days[key] = []																				# every iteration generates new hash element with an empty array like so, @days[0] = []
			pairs_of_the_day.times do |students_index|									# iterates for putting in pairs
				@days[key] << [students[students_index], students.reverse[students_index]]     # insert an array of [students[0], students.reverse[0]], [students[1],[students.reverse[1]]...and so forth.
			end

			students = [students[0]] + students[1..-1].rotate(-1)     # round robin logic. Fix the position of students[0], and rotate the remainings.
																																# students[-1] element comes into the position of student[1]
		end
	end
end
