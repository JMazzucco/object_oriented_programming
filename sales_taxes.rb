
#sales taxes are excluded if one or more of the following keywords are exist in the item name
medical = ["eyedrops", "lozenges", "pills"]
food = ["banana", "apples", "chocolate"]

def round_5(amount)
	#limit amount to two decimal places
	amount = ((amount * 100).to_i).to_f/100
	#do nothing if passed amount is divisable by 0.05
	unless (amount % 0.05 == 0)
		#if the last digit is greater than 0.05, round up to the next tenth
		if amount.to_s[-1].to_i > 5
			return amount.round(1)
		else
			#if the last digit is greater than 0 and less than 5, replace it with 5
			return (((amount * 10).to_i) * 10 + 5).to_f/100
		end
	end
	return amount
end

#create an empty hash and accept user input for the first item
shopping_basket = Hash.new
new_item = gets.chomp

#coninue to accept items from the user until an empty string is returned
until new_item == ""
	#remove all numbers, special characters, extra spaces and "at" from the item name
	item_name = new_item.gsub(/[0-9]/, '').gsub('at', '').gsub(/[^a-z]/, ' ').strip

	#assign the last 5 characters of the string as the item price
	item_price = new_item[-5..-1].strip.to_f

	#assign the first 2 digits in the string as the item quantity
	item_quant = new_item[0..1].strip.to_i

	basket_key = "#{item_quant} #{item_name}"
	item_subtotal = (item_price * item_quant)

	#add item to the shopping_basket hash
	shopping_basket[basket_key] = item_subtotal

	#puts "#{item_quant} #{item_name} : #{item_price}"
	new_item = gets.chomp
end

#set variables that will be used in shopping_basket iterations
item_tax, item_sales_tax, item_duty_tax, total_tax, item_total, grand_total, tax_rounded = 0, 0, 0, 0, 0, 0, 0
exclude_tax, duty_tax = false, false

#iterate through each item in the shopping_basket hash
shopping_basket.each do |k, v|
	#iterate through each word in the item name and check if it includes keywords
	k.split(' ').each do |x|
		exclude_tax = true if medical.include?(x) || food.include?(x) || x.include?("book")
		duty_tax = true if x.include?("imported")
	end

	#apply sales and/or duty tax if applicable
	item_sales_tax = (v * 0.10) unless exclude_tax
	item_duty_tax = (v * 0.05) if duty_tax

	#sum of item tax
	item_tax = (item_sales_tax + item_duty_tax).to_f

	#pass the item tax to the round_5 method to round up amount to the nearest 5 cents
  tax_rounded = round_5(item_tax)

	#add tax to the item amount and round value to the second decimal place
	item_total = (tax_rounded + v).round(2)

	#sum of tax and item total for each item in shopping_basket hash
	total_tax += tax_rounded
	grand_total += item_total

	#display the quantity, the item name and the item total amount including tax
  puts "#{k} : #{item_total}"

  #reset values for next iteration
	exclude_tax, duty_tax = false, false
  item_duty_tax, item_sales_tax = 0, 0
end


#display total amounts
puts "________________"
puts "Sales Tax: #{total_tax.round(2)}"
puts "Total: #{grand_total.round(2)}"