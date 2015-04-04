
medical = ["eyedrops", "lozenges", "pills"]
food = ["banana", "apples", "chocolate"]

shopping_basket = Hash.new
new_item = gets.chomp

until new_item == ""
item_name = new_item.gsub(/[0-9]/, '').gsub('at', '').gsub(/[^a-z]/, ' ').strip
item_price = new_item[-5..-1].strip.to_f

#first number (i.e. item quantity) in new_item string cannot be over 99
item_quant = new_item[0..1].strip.to_i

basket_key = "#{item_quant} #{item_name}"

item_subtotal = (item_price * item_quant)
# puts item_subtotal

shopping_basket[basket_key] = item_subtotal


# puts "#{item_quant} #{item_name} : #{item_price}"

new_item = gets.chomp
end

no_tax_total = 0
shopping_basket.each {|k, v| no_tax_total += v}

total_tax = 0
exclude_tax = false
duty_flag = false

shopping_basket.each do |k, v|
	k.split(' ').each do |x|
		exclude_tax = true if medical.include?(x) || food.include?(x) || k.include?("book")
		duty_flag = true if k.include?("imported")

	end
	total_tax += (v * 0.10) unless exclude_tax
	total_tax += (v * 0.05) if duty_flag

end
puts total_tax








