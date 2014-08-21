class CompareSort
	def self.run(info)
		data = info[:data]
		sorting_method = info[:sorting_method]
		timer = info[:timer]

		ValidateData.run(data)

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

	def self.compare_all(info)
		data = info[:data]
		view = info[:view]

		sorting_methods = %w(HeapSort QuickSort SelectionSort BubbleSort ModifiedBubbleSort InsertionSort MergeSort)
		sorting_times = {}
		info_hash = { data: data.dup, timer: true }

		sorting_methods.each do |method|
			info_hash = { data: data.dup, sorting_method: method, timer: true }
			sorting_times[method] = self.run(info_hash)
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

class ValidateData

	def self.run(data)
		@data = data
		self.isArray
		self.valuesAreConsistent
	end 

	def self.isArray
		raise "Data must be an array" if (!@data.is_a?(Array))
	end 

	def self.valuesAreConsistent
		if @data[0].is_a?(String)
			valuesAreStrings
		else
			valuesAreNumbers
		end
	end 

	def self.valuesAreNumbers
		@data.each do |datum|
			if (!datum.is_a?(Fixnum) && !datum.is_a?(Float))
				raise "Values in array must be all numbers OR all strings" 
			end
		end 
	end

	def self.valuesAreStrings
		@data.each do |datum|
			if (!datum.is_a?(String))
				raise "Values in array must be all numbers OR all strings" 
			end
		end 
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

class MergeSort 
	def self.run(nums)
		return nums if nums == []
		#split into single arrays 
		nums.map! {|num| [num]}

		#run until sorted
		while nums.length != 1
			i = 0
			#iterate through the nested array and merge them
			while i < nums.length
				merged_nums = self.merge(nums[i], nums[i+1])
				nums.delete_at(i+1)
				nums.delete_at(i)
				nums.insert(i, merged_nums)
				i += 1
			end 
		end
		return nums[0]
	end

	def self.merge(nums1, nums2)
		# this will happen if there are an off number of arrays
		return nums1 if !nums2

		total_length = nums1.length + nums2.length
		sorted_nums = []

		until sorted_nums.length == total_length
			if nums2.empty?
				sorted_nums += nums1
			elsif nums1.empty?
				sorted_nums += nums2
			elsif nums2[0] < nums1[0]
				sorted_nums << nums2.shift
			else 
				sorted_nums << nums1.shift
			end 
		end
		return sorted_nums
	end 
end 


class QuickSort 
	def self.run(data)
		return data if data.length <= 1

		return self.sort_section(data, 0, data.length-1)
	end 

	def self.sort_section(data, start_loc, end_loc)
		return data if end_loc - start_loc <1
		wall = start_loc
		pivot = data[end_loc]


		for i in start_loc..end_loc #valid indicies
			if data[i]<pivot
				smaller_datum = data[i]
				data.delete_at(i)
				data.insert(wall, smaller_datum)
				wall += 1
			end 
		end 
			data.insert(wall, pivot)
			data.delete_at(end_loc + 1)

		self.sort_section(data, start_loc, wall-1)
		self.sort_section(data, wall+1, end_loc)
	end 
end 

class HeapSort 
	def self.run(data)
		return data if data.length <= 1

		# create heap 
		heap = self.create_heap(data)

		# then sort
		sorted_data  = self.sort_heap(heap)

		return sorted_data
	end 

	def self.create_heap(data)
		for i in 0..(data.length-1)
			# if they are greater than their parent swap them
			current_index = i
			current_value = data[i]
			parent_index = get_parent(i)

			while parent_index != nil && current_value > data[parent_index]
				parent_value = data[parent_index]

				# swap
				data[parent_index] = current_value
				data[current_index] = parent_value

				#reset values
				current_index = parent_index
				parent_index = get_parent(current_index)
				
			end  
		end 
		return data
	end

	def self.get_parent(index)
		parent_index = (index-1)/2
		return nil if parent_index < 0 
		return parent_index
	end

	def self.sort_heap(heap)
		number_sorted = 0

		while number_sorted < heap.length
			# switch the root and the last element 
			# puts "swapping root: #{heap[0]} with bottom: #{heap[-1-number_sorted]}"

			heap[0], heap[-1-number_sorted] = heap[-1-number_sorted], heap[0]
			# p heap

			number_sorted += 1
			current_index = 0
			current_value = heap[0]

			while !self.valid_parent(current_index, heap, number_sorted)

				# find highest valid child index
				max_child_i = self.find_larger_child(current_index, heap, number_sorted)
		
				# swap them 

				heap[max_child_i], heap[current_index] = heap[current_index], heap[max_child_i]

				# reset values
				current_index = max_child_i

			end 
		end 
		return heap

	end 

	def self.find_larger_child(parent_index, heap, number_sorted)
		children_i = []

		l_child_i = left_child_index(parent_index)
		r_child_i = right_child_index(parent_index)

		if l_child_i < (heap.length - number_sorted)
			children_i << l_child_i
		end 

		if r_child_i < (heap.length - number_sorted)
			children_i << r_child_i
		end 

		return nil if children_i.length == 0

		max_child_i = children_i[0]

		children_i.each do |index|
			max_child_i = index if heap[index] > heap[max_child_i]
		end 

		return max_child_i

	end   

	def self.valid_parent(parent_index, heap, number_sorted)
		parent_value = heap[parent_index]

		valid = true 
		l_child_i = left_child_index(parent_index)
		r_child_i = right_child_index(parent_index)

		if l_child_i < (heap.length - number_sorted) && heap[l_child_i] > heap[parent_index]
			valid = false
		end 

		if r_child_i < (heap.length - number_sorted) && heap[r_child_i] > heap[parent_index]
			valid = false 
		end 

		return valid
	end 

	def self.left_child_index(parent_index)
		return 2*parent_index + 1
	end 

	def self.right_child_index(parent_index)
		return 2*parent_index + 2
	end 
end 










