#assign a name that is passed as an instance variable
class Person
	def initialize(name)
		@name = name
	end
	def greeting
		"Hi, my name is #{@name}"
	end
end

#inherit methods from Person class
class Student < Person
	def learn
		"i get it!"
	end
end

#inherit methods from Person class
class Instructor < Person
	def teach
		"Everything in Ruby is an Object"
	end
end

#create new instances of the Student and Instructor classes
new_inst = Instructor.new("Chris")
new_student = Student.new("Cristina")

#call the greeting method in both instances and display the returned values
puts new_inst.greeting
puts new_student.greeting

#call the remaining method in each instance
puts new_inst.teach
puts new_student.learn

#calling the teach method on an instance of the Student class does not work as the method is encapsulated in the Instructor class and is not accessible from other classes - it would work if Instructor was a parent class of Student.
#puts new_student.teach