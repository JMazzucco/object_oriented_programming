class Rover
	def initialize(x, y)
		@x = x
		@y = y
	#@direction = direction
	puts @x
	puts @y
	end

# 	# def read_instructions
# 	# 	#tell rover to move or turn - delegates to move and turn methods
# 	# 	@direction.each do |x|
# 	# 		move if x == "m"
# 	# 		turn if x == "l" || x =="r"
# 	# 	end
# 	# end

# 	# def move
# 	# 	#when an "m" is passed, this method affects the position of the rover, then updates co-orinates.
# 	# 	puts "move method called"

# 	# end

# 	# def turn
# 	# 	#turns rover when a L or R is passed. Checks current position (direction), turns rover once, then updates the direction parameter.
# 	# 	puts "turn method called"
# 	# end
end


# puts "type upper-right coordinates of plateau"
# plat_limit = gets.chomp.split('')
# x_limit = plat_limit.first
# y_limit = plat_limit.last

#remove characters from passed string, then split numbers into an array and convert them to integers
def coord_crop(coord_str)
	crop_char = coord_str.gsub(/[A-Za-z]/, " ")
	crop_sym = coord_str.gsub(/[^0-9]/, " ")
	crop_space = crop_sym.gsub(/\s+/, " ")
	coord_array = crop_space.split
	coord_array.collect! {|x| x.to_i }
end

#prompt user to enter coordinates, then pass string to the coord_crop method
puts "type current coordinates for Rover"
coord_edited = coord_crop(gets.chomp)

#prompt user for coordinates until an array of 2 integers is returned
until coord_edited.count == 2
	puts "Invalid coordinates. Please try again."
	coord_edited = coord_crop(gets.chomp)
end

#assign the first number in the array as x, and the second as y
x = coord_edited[0]
y = coord_edited[1]

#puts "type instructions for Rover"
# direction = gets.chomp.downcase.split('')
# #p direction

#create a new instance of the Rover class and pass it the x and y coordinates
Rover.new(x, y)
