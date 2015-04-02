
class Student < Parent
	def initialize(name)
		@name = name
	end

	def learn
		"I get it"
	end
end

class Instructor
	def initialize(name)
		@name = name
	end
	def teach
		"everything in Ruby is an object"
	end
end

class Parent
end


test = Student.new
puts test.learn