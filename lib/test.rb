require_relative 'compare-sort'
require 'rspec'

describe "ValidateData" do
	it "raises no error if data is array" do 
		expect { ValidateData.run([]) }.not_to raise_error
	end 
	it "raises an error if data is not an array" do 
		expect { ValidateData.run({}) }.to raise_error
	end 
	it "raises an error if data is not ALL numbers or strings" do 
		expect { ValidateData.run(["a", 1]) }.to raise_error
	end 
	it "does not raise an error if data IS all numbers" do 
		expect { ValidateData.run([1, 2, 3]) }.not_to raise_error
	end 
	it "does not raise an error if data is all strings" do
		expect { ValidateData.run(["a", "b", "c"]) }.not_to raise_error
	end 
end 

describe "BubbleSort"do
	it "sorts numbers correctly" do 
		data = (1..10).to_a
		expect(BubbleSort.run(data.shuffle)).to eq(data)
	end 
	it "sorts strings correctly" do 
		data = ("a".."z").to_a
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
	it "sorts strings correctly" do 
		data = ("a".."z").to_a
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
	it "sorts strings correctly" do 
		data = ("a".."z").to_a
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
	it "sorts strings correctly" do 
		data = ("a".."z").to_a
		expect(InsertionSort.run(data.shuffle)).to eq(data)
	end 
	it "when passed an empty array, it returns an empty array" do
		expect(InsertionSort.run([])).to eq([]) 
	end 
	it "when passed an array with one element, it returns it" do 
		expect(InsertionSort.run([1])).to eq([1]) 
	end 
end 

describe "MergeSort"do
	it "sorts correctly" do 
		data = (1..10).to_a
		expect(MergeSort.run(data.shuffle)).to eq(data)
	end 
	it "sorts strings correctly" do 
		data = ("a".."z").to_a
		expect(MergeSort.run(data.shuffle)).to eq(data)
	end 
	it "when passed an empty array, it returns an empty array" do
		expect(MergeSort.run([])).to eq([]) 
	end 
	it "when passed an array with one element, it returns it" do 
		expect(MergeSort.run([1])).to eq([1]) 
	end 
end 

describe "QuickSort"do
	it "sorts correctly" do 
		data = (1..10).to_a
		expect(QuickSort.run(data.shuffle)).to eq(data)
	end 
	it "sorts strings correctly" do 
		data = ("a".."z").to_a
		expect(QuickSort.run(data.shuffle)).to eq(data)
	end 
	it "when passed an empty array, it returns an empty array" do
		expect(QuickSort.run([])).to eq([]) 
	end 
	it "when passed an array with one element, it returns it" do 
		expect(QuickSort.run([1])).to eq([1]) 
	end 
end 

describe "HeapSort" do
	it "sorts correctly" do 
		data = (1..10).to_a
		expect(HeapSort.run(data.shuffle)).to eq(data)
	end 
	it "sorts strings correctly" do 
		data = ("a".."z").to_a
		expect(HeapSort.run(data.shuffle)).to eq(data)
	end 
	it "when passed an empty array, it returns an empty array" do
		expect(HeapSort.run([])).to eq([]) 
	end 
	it "when passed an array with one element, it returns it" do 
		expect(HeapSort.run([1])).to eq([1]) 
	end 
end 

describe "CompareSort"do
	it "bubble sorts correctly" do 
		data = (1..10).to_a
		info = { data: data.shuffle,
				 sorting_method: "BubbleSort" }
		expect(CompareSort.run(info)).to eq(data)
	end 
	it "modified bubble sorts correctly" do 
		data = (1..10).to_a
		info = { data: data.shuffle,
				 sorting_method: "ModifiedBubbleSort" }
		expect(CompareSort.run(info)).to eq(data)
	end 
	it "merge sorts correctly" do 
		data = (1..10).to_a
		info = { data: data.shuffle,
				 sorting_method: "MergeSort" }
		expect(CompareSort.run(info)).to eq(data)
	end 
	it "insertion sorts correctly" do 
		data = (1..10).to_a
		info = { data: data.shuffle,
				 sorting_method: "InsertionSort" }
		expect(CompareSort.run(info)).to eq(data)
	end 
	it "selection sorts correctly" do 
		data = (1..10).to_a
		info = { data: data.shuffle,
				 sorting_method: "SelectionSort" }
		expect(CompareSort.run(info)).to eq(data)
	end 

	it "heap sorts correctly" do 
		data = (1..10).to_a
		info = { data: data.shuffle,
				 sorting_method: "HeapSort" }
		expect(CompareSort.run(info)).to eq(data)
	end 
end 
