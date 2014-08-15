require_relative 'compareSort'

# p BubbleSort.run([1, 2, 5, 3, 9, 1])

data = (1...1000).to_a.shuffle
p CompareSort.compare_all(data, true)


# data = [3,2,1, 7, 4, 2, 6, 8, 0, 1]
# p InsertionSort.run(data)