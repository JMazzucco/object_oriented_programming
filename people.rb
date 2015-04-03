
class Parent
	def initialize(name)
		@name = name
	end
end


class Student < Parent

	def learn
		"i get it!"
	end

	def greeting
		"Hi, my name is #{@name}"
	end

end

class Instructor < Parent

	def teach
		"Everything in Ruby is an Object"
	end

	def greeting
		"Hi, my name is #{@name}"
	end

end



new_inst = Instructor.new("test")
puts new_inst.greeting

new_student = Student.new("test2")
puts new_student.greeting
