#compare-sort
<strong>compare-sort</strong> is a gem that allows users to select a specific sorting algorithm to use, time a specific algorithm, or compare the times of all sorting algorithms. 

See the gem homepage [here](https://rubygems.org/gems/graph-ruby/).

##Setup

In the terminal run 
```ruby
gem install compare-sort
```

Add the following to the top of your Ruby file
```ruby
require 'compare-sort'
```

##Usage

###Valid Data For Sorting

Your data must be in an array. All elements must be strings OR numbers. 
```ruby
valid_data1 = [1, 2, 3.5, 0]
valid_data2 = ["r", "u", "b", "y"]
```

###Sort Using a Specific Algorithm

```ruby
numbers = [1, 2, 3.5, 0]

# The data needs to be passed in as a hash
# The sorting method needs to be specified as a string
CompareSort.run(data: numbers, sorting_method: "BubbleSort")
# => [0, 1, 2, 3.5]

# The valid sorting method names are: 
# - BubbleSort (0.0.1+)
# - ModifiedBubbleSort (0.0.1+)
# - SelectionSort (0.0.1+)
# - InsertionSort (0.0.1+)
# - QuickSort (0.1.0+)
# - MergeSort (0.1.0+)

```
###Time Specific Algorithm

```ruby
numbers = [1, 2, 3.5, 0]

# Timer boolean needs to be passed in as a hash
CompareSort.run(data: numbers, sorting_method: "BubbleSort", timer: true)
# => 2.2e-05
```

###Compare Times of All Algorithms
Use gem 0.1.0+ for comparing all algorithms. 

```ruby
numbers = [1, 2, 3.5, 0]

# Without a terminal output 
CompareSort.compare_all(data: numbers)
# => {"SelectionSort"=>2.2e-05, "BubbleSort"=>1.9e-05, "ModifiedBubbleSort"=>2.5e-05, "InsertionSort"=>1.9e-05} 

# With a terminal output 
CompareSort.compare_all(data: numbers, view: true)
# => {"SelectionSort"=>2.2e-05, "BubbleSort"=>1.9e-05, "ModifiedBubbleSort"=>2.5e-05, "InsertionSort"=>1.9e-05} 
```
![compare all ](/images/compare_all.png?raw=true "compare all ")

