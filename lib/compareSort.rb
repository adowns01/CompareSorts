class CompareSort
  def self.bubble(data)
    return BubbleSort.run(data)
  end

  def self.modBubble(data)
    return ModifiedBubbleSort.run(data)
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

		return data

	end
end 

class BubbleSort
	def self.run(data)
		# Make sure there are at least 2 items in the array
		# Create iterators

		sorted = false 
		
		# counter = 1
		(data.length).times  do |i|


			(data.length - 1).times  do |j|
				if (data[j] > data[j+1])
					low_value = data[j+1]
					data[j+1] = data[j]
					data[j] = low_value
				end
			end 
		end

		return data

	end
end 