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

	def self.compare_all(data, view=false)

		sorting_methods = %w(SelectionSort BubbleSort ModifiedBubbleSort InsertionSort)
		sorting_times = {}

		sorting_methods.each do |method|
			info = { data: data, sorting_method: method, timer: true }
			sorting_times[method] = self.run(info)
		end 

		if view
			View.compare_all(sorting_times.sort_by{|method, time| time})
		end

		return sorting_times

	end
end

class View 
	def self.compare_all(data)
		puts ""
		print "SORTING METHOD"
		print " "*(6)
		puts "SECONDS"
		puts "-"*27
		data.each do |datum| 
			print datum[0]
			print " "*(20-datum[0].length)
			puts datum[1]
		end 
		puts ""
	end 
end 


class InsertionSort
	def self.run(data)

		# iterate through each element
		data.each_with_index do |unsorted_num, i|
			data[0..i].each_with_index do |sorted_num, j|
					
				if sorted_num > unsorted_num
					# insert to its new spot
					data.insert(j, unsorted_num)
					# delete it from old spot
					data.delete_at(i+1)
					break
				end

			end
		end		
		return data
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



