# class Rover
# 	def initialize(x, y, direction)
# 		@x = x
# 		@y = y
# 		puts x
# 		puts y
# 		@direction = direction
# 		p direction
# 	end

	# def read_instructions
	# 	#tell rover to move or turn - delegates to move and turn methods
	# 	@direction.each do |x|
	# 		move if x == "m"
	# 		turn if x == "l" || x =="r"
	# 	end
	# end

	# def move
	# 	#when an "m" is passed, this method affects the position of the rover, then updates co-orinates.
	# 	puts "move method called"

	# end

	# def turn
	# 	#turns rover when a L or R is passed. Checks current position (direction), turns rover once, then updates the direction parameter.
	# 	puts "turn method called"
	# end

#end


# puts "type upper-right coordinates of plateau"
# plat_limit = gets.chomp.split('')
# x_limit = plat_limit.first
# y_limit = plat_limit.last

puts "type current coordinates for Rover"
plat_input = gets.chomp.split

x = plat_input[0].to_i
y = plat_input[1].to_i
p plat_input
puts x
puts y

# puts "type instructions for Rover"
# direction = gets.chomp.downcase.split('')


#Rover.new(x, y, direction)
