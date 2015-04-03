class Rover
	def initialize(x_limit, y_limit, x, y, direction)
		@x_limit = x_limit
		@y_limit = y_limit
		@x = x
		@y = y
		@direction = direction
		@current_dir = "N"
	end

	def read_instructions
		#tell rover to move or turn - delegates to move and turn methods
		@direction.each do |x|

			move if x == "m"

			if x == "l" || x == "r"
				@dir = x
				turn
			end

		end

		#display final coorindates and direction
		puts "#{@x} #{@y} #{@current_dir}"
	end

	def move
		#when an "m" is passed, this method affects the position of the rover, then updates co-orinates.
		if @y > 0 && @y < @y_limit && (@current_dir == "N" || @current_dir == "S")
				if @current_dir == "N"
					@y += 1
				elsif @current_dir == "S"
					@y -= 1
				end
		elsif @x > 0 && @x < @x_limit && (@current_dir == "W" || @current_dir == "E")
				if @current_dir == "W"
					@x -= 1
				elsif @current_dir == "E"
					@x += 1
				end
		else
				puts "The rover is at the edge of the plateau, and it cannot move futher #{@current_dir}"
		end
	end

	def turn
		#turns rover when a L or R is passed. Checks current position (direction), turns rover once, then updates the direction parameter.
		if @dir == "r"
			case @current_dir
				when "N"
					@current_dir = "E"
				when "E"
					@current_dir = "S"
				when "S"
					@current_dir = "W"
				when "W"
					@current_dir = "N"
			end

		elsif @dir == "l"
			case @current_dir
				when "N"
					@current_dir = "W"
				when "W"
					@current_dir = "S"
				when "S"
					@current_dir = "E"
				when "E"
					@current_dir = "N"
			end
		end
	end

end

#remove characters from passed string, then split numbers into an array and convert them to integers
def coord_crop(coord_str)
	crop_char = coord_str.gsub(/[A-Za-z]/, " ")
	crop_sym = coord_str.gsub(/[^0-9]/, " ")
	crop_space = crop_sym.gsub(/\s+/, " ")
	coord_array = crop_space.split
	coord_edited = coord_array.collect! {|x| x.to_i }

#prompt user for coordinates until an array of 2 integers is returned
 	if coord_edited.count != 2
		puts "Invalid coordinates. Please try again."
		coord_crop(gets.chomp)
	else
		return coord_edited
	end
end

#only keep characters in passed string if they are "r", "l" or "m"
def direction_crop(direction_str)
	direction_array = direction_str.downcase.split('')
	direction_array.keep_if {|d| d == "r" || d == "l" || d == "m"}
end

#prompt user to enter plateau limit coorinates, then pass string to the coord_crop method
puts "type upper-right coordinates of plateau"
plat_limit = coord_crop(gets.chomp)
x_limit = plat_limit[0]
y_limit = plat_limit[1]

#prompt user to enter coordinates, then pass string to the coord_crop method
puts "type current coordinates for Rover One"
coord_final = coord_crop(gets.chomp)
x1 = coord_final[0]
y1 = coord_final[1]

#prompt user for rover
puts "type instructions for Rover One"
direction1 = direction_crop(gets.chomp)

#prompt user to enter coordinates, then pass string to the coord_crop method
puts "type current coordinates for Rover Two"
coord_final = coord_crop(gets.chomp)
x2 = coord_final[0]
y2 = coord_final[1]

#prompt user for rover
puts "type instructions for Rover Two"
direction2 = direction_crop(gets.chomp)

#create a new instance of the Rover class and pass it the x and y coordinates
rover_new1 = Rover.new(x_limit, y_limit, x1, y1, direction1)
rover_new1.read_instructions

rover_new2 = Rover.new(x_limit, y_limit, x2, y2, direction2)
rover_new2.read_instructions




