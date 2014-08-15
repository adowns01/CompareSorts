require_relative 'compareSort'

# p BubbleSort.run([1, 2, 5, 3, 9, 1])

# data = (1...1000).to_a.shuffle
# p CompareSort.compare_all(data, true)


# data = [3,2,1, 7, 4, 2, 6, 8, 0, 1]
# p InsertionSort.run(data)

require 'rspec'

describe "BubbleSort"do
	it "sorts correctly" do 
		data = (1..10).to_a

		expect(BubbleSort.run(data.shuffle)).to eq(data)
	end 
	it "when passed an empty array, it returns an empty array"
	it "when passed an array with one element, it returns it"

end 

describe "ModifiedBubbleSort"do
	it "sorts correctly"
	it "when passed an empty array, it returns an empty array"
	it "when passed an array with one element, it returns it"

end 

describe "SelectionSort"do
	it "sorts correctly"
	it "when passed an empty array, it returns an empty array"
	it "when passed an array with one element, it returns it"
end 

describe "InsertionSort"do
	it "sorts correctly"
	it "when passed an empty array, it returns an empty array"
	it "when passed an array with one element, it returns it"
end 



