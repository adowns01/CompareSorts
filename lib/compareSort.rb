class CompareSort
	def self.run(info)
		data = info[:data]
		sorting_method = info[:sorting_method]
		timer = info[:timer]

		if timer 
			sort = lambda { eval(sorting_method).run(data) }
			return self.timer(sort)
		else 
			return eval(sorting_method).run(data)
		end

	end

	def self.timer(sorting_method)
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



