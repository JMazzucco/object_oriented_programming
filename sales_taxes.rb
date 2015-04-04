


shopping_basket = Hash.new
new_item = gets.chomp

until new_item == ""
item_name = new_item.gsub(/[0-9]/, '').gsub('at', '').gsub(/[^a-z]/, '').strip
item_price = new_item[-5..-1].strip.to_f
#first number (i.e. item quantity) in new_item string cannot be over 99
item_quant = new_item[0..1].strip.to_i

basket_key = "#{item_quant} #{item_name}".to_s

item_subtotal = (item_price * item_quant)
# puts item_subtotal

shopping_basket[basket_key] = item_subtotal


# puts "#{item_quant} #{item_name} : #{item_price}"

new_item = gets.chomp
end

# sales_tax = 0.10
# duty_tax = 0.05
no_tax_total = 0
shopping_basket.each {|k, v| no_tax_total += v}
puts no_tax_total



# total_tax = 0
# shopping_basket.each do |k, v|
# 		unless medical.has_key(k) || books.has_key(k) || food.has_key(k)
# 			total_tax = v * 0.10
# 		end

# 		if imports.has_key(k)
# 			total_tax = v * 0.05
# 		end
# end


# basket_one = {
# "book" => 12.49,
# "music CD" => 14.99,
# "chocolate bar" => 0.85,
# }

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





