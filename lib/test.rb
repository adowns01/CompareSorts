require_relative 'compareSort'
require 'rspec'

describe "BubbleSort"do
	it "sorts correctly" do 
		data = (1..10).to_a
		expect(BubbleSort.run(data.shuffle)).to eq(data)
	end 
	it "when passed an empty array, it returns an empty array" do
		expect(BubbleSort.run([])).to eq([]) 
	end 
	it "when passed an array with one element, it returns it" do 
		expect(BubbleSort.run([1])).to eq([1]) 
	end 
end 

describe "ModifiedBubbleSort"do
	it "sorts correctly" do 
		data = (1..10).to_a
		expect(ModifiedBubbleSort.run(data.shuffle)).to eq(data)
	end 
	it "when passed an empty array, it returns an empty array" do
		expect(ModifiedBubbleSort.run([])).to eq([]) 
	end 
	it "when passed an array with one element, it returns it" do 
		expect(ModifiedBubbleSort.run([1])).to eq([1]) 
	end 
end 

describe "SelectionSort"do
	it "sorts correctly" do 
		data = (1..10).to_a
		expect(SelectionSort.run(data.shuffle)).to eq(data)
	end 
	it "when passed an empty array, it returns an empty array" do
		expect(SelectionSort.run([])).to eq([]) 
	end 
	it "when passed an array with one element, it returns it" do 
		expect(SelectionSort.run([1])).to eq([1]) 
	end 
end 

describe "InsertionSort"do
	it "sorts correctly" do 
		data = (1..10).to_a
		expect(InsertionSort.run(data.shuffle)).to eq(data)
	end 
	it "when passed an empty array, it returns an empty array" do
		expect(InsertionSort.run([])).to eq([]) 
	end 
	it "when passed an array with one element, it returns it" do 
		expect(InsertionSort.run([1])).to eq([1]) 
	end 
end 



