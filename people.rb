
class Person
	def initialize(name)
		@name = name
	end
end


class Student < Person

	def learn
		"i get it!"
	end

	def greeting
		"Hi, my name is #{@name}"
	end

end

class Instructor < Person

	def teach
		"Everything in Ruby is an Object"
	end

	def greeting
		"Hi, my name is #{@name}"
	end

end



new_inst = Instructor.new("Chris")
puts new_inst.greeting

new_student = Student.new("Cristina")
puts new_student.greeting

puts new_inst.teach
puts new_student.learn