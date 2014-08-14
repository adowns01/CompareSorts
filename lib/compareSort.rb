class CompareSort
  def self.hi
    puts "Hello world!"
  end
end


class ModifiedBubbleSort
	def self.run(data)
		# Make sure there are at least 2 items in the array
		# Create iterators

		sorted = false 
		
		# counter = 1
		while !sorted 
			sorted = true
			(data.length - 1).times  do |i|
				if (data[i] > data[i+1])
					low_value = data[i+1]
					data[i+1] = data[i]
					data[i] = low_value
					sorted = false 
				end
			end 
		end

		p data

	end
end 

