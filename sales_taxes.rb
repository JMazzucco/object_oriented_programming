# sales_tax = 0.10
# duty_tax = 0.05

# basket_one = {
# "book" => 12.49,
# "music CD" => 14.99,
# "chocolate bar" => 0.85,
# }

shopping_basket = Hash.new
new_item = gets.chomp

#until new_item == ""
item_name = new_item.gsub(/[0-9]/, '').gsub('at', '').gsub(/[^a-z]/, '').strip
item_price = new_item[-5..-1].strip
item_quant = new_item[0]

puts "#{item_quant} #{item_name} : #{item_price}"


	#new_item = gets.chomp

#end


# basket_two = {
# "imported box of chocolates" => 10.00,
# "imported bottle of perfume" => 47.50,
# }


# basket_three = {
# "imported bottle of perfume" => 27.99,
# "bottle of perfume" => 18.99,
# "packet of headache pills" => 9.75,
# "box of imported chocolates" => 11.25
# }



		# basket_one.each do |name, price|
		# 	if medical[name] != nil
		# 		price = price * sales_tax
		# 	puts "#{name} : #{price}"
		# end





