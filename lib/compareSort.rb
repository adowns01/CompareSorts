class CompareSort
	def self.bubble(data, time = false)

		if time 
			lam = lambda { BubbleSort.run(data) }
			return self.time(lam)
		else 
			return BubbleSort.run(data)
		end

	end

	def self.modBubble(data, time = false)
		if time 
			lam = lambda { ModifiedBubbleSort.run(data) }
			return self.time(lam)
		else 
			return ModifiedBubbleSort.run(data)
		end

	end 

	def self.time(sorting_method)
		start_time = Time.now
		sorted_list = sorting_method.call 
		end_time = Time.now

		return end_time - start_time
	end 
end




class SelectionSort
	def self.run(data)
		len = data.length

		# iterate through each element in the array
		for i in 0..len-2
			min_index = i
			# iterate through the rest of the array
			for j in i+1..len-1
				# if min, save index
				min_index = j if data[j] < data[min_index]
			end
			# put the min in it's correct spot
			data[i], data[min_index] = data[min_index], data[i]
		end

		return data
	end
end 


class ModifiedBubbleSort
	def self.run(data)
		sorted = false 

		while !sorted 
			sorted = true
			# iterate through the whole array
			(data.length - 1).times  do |i|
				# if the element ahead of the one we are on is smaller 
				# then switch them
				if (data[i] > data[i+1])
					data[i+1], data[i] = data[i], data[i+1]
					sorted = false 
				end
			end 
		end
		return data
	end
end 

class BubbleSort
	def self.run(data)
		sorted = false 
		
		(data.length).times  do |i|
			(data.length - 1).times  do |j|

				if (data[j] > data[j+1])
					data[j+1], data[j] = data[j], data[j+1]
				end
			end 
		end

		return data
	end
end 



