
#sales taxes are excluded if one or more of the following keywords are in item_name
medical = ["eyedrops", "lozenges", "pills"]
food = ["banana", "apples", "chocolate"]

def round_5(amount)
	amount = ((amount * 100).to_i).to_f/100
	unless (amount % 0.05 == 0)
		if amount.to_s[-1].to_i > 5
			return amount.round(1)
		else
			return (((amount * 10).to_i) * 10 + 5).to_f/100
		end
	end
	return amount
end

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
	#puts "#{item_quant} #{item_name} : #{item_price}"
	new_item = gets.chomp
end


# shopping_basket.each {|k, v| no_tax_total += v}
item_tax, item_sales_tax, item_duty_tax, total_tax, item_total, grand_total, tax_rounded = 0, 0, 0, 0, 0, 0, 0
exclude_tax, duty_tax = false, false


shopping_basket.each do |k, v|
	k.split(' ').each do |x|
		exclude_tax = true if medical.include?(x) || food.include?(x) || x.include?("book")
		duty_tax = true if x.include?("imported")
	end

	item_sales_tax = (v * 0.10) unless exclude_tax
	item_duty_tax = (v * 0.05) if duty_tax

	item_tax = (item_sales_tax + item_duty_tax).to_f
  tax_rounded = round_5(item_tax)

	total_tax += tax_rounded
	item_total = (tax_rounded + v).round(2)

	grand_total += item_total
  puts "#{k} : #{item_total}"

  #reset values for next iteration
	exclude_tax, duty_tax = false, false
  item_duty_tax, item_sales_tax = 0, 0
end

puts "________________"
puts "Sales Tax: #{total_tax.round(2)}"
puts "Total: #{grand_total.round(2)}"