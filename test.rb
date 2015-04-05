def round_5(amount)
	unless ((amount * 100) % 5 == 0)
		if amount.to_s[-1].to_i < 5
			puts amount.round(1)
		else amount.to_s[-1].to_i > 5
			puts amount.round(1)
		end
	end
end

puts round_5(19.08)