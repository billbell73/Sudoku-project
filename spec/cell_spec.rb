require 'cell'


describe Cell do
	let(:cell) { Cell.new(0,0,0) }
	
	let(:grid) { double :grid }

	it 'knows if it\'s filled out' do
		expect(cell.filled_out?).to be_true
	end

	xit 'can tell candidate numbers when empty' do
		expect(cell.candidates).to be_instance_of Array
	end

	xit 'can tell it\'s neighbours' do
		grid = double :grid, cells: [2,3,4], transpose: [[2],[3],[4]]
		expect(cell.get_values_of_neighbours_from grid).to be_instance_of Array
	end

	it 'can get the full grid' do
		expect(grid).to receive(:cells)
		cell.get_grid_from grid
	end

	it 'returns the values of cells in the same row' do
		grid = [[0,0,1],[2,3,4],[5,0,0]]
		expect(cell.values_in_same_row grid).to eq [0,0,1]
	end

	it 'returns the values of cells in the same column' do
		grid = [[0,0,1],[2,3,4],[5,0,0]]
		expect(cell.values_in_same_column grid).to eq [0,2,5]
	end

	it 'can tell its square number if it is at index [0][0]' do
		expect(cell.sudoku_square_number_of_cell).to eq 0
	end

	it 'can tell its square number if it is at index [7][1]' do
		cell = Cell.new(0, 7, 1)
		expect(cell.sudoku_square_number_of_cell).to eq 6
	end

	it 'can tell its square number if it is at index [5][8]' do
		cell = Cell.new(0, 5, 8)
		expect(cell.sudoku_square_number_of_cell).to eq 5
	end

	it 'can tell square number for given x and y co-ordinates' do
		expect(cell.sudoku_square_number_of 5, 3).to eq 4
	end

	it 'returns indices of cells in same square' do
		expect(cell.indices_of_cells_in_same_square).to eq [[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]]
	end

	it 'returns indices of cells in same square, different example' do
		cell = Cell.new(0, 6, 8)
		expect(cell.indices_of_cells_in_same_square).to eq [[6, 6], [6, 7], [6, 8], [7, 6], [7, 7], [7, 8], [8, 6], [8, 7], [8, 8]]
	end

 	it 'knows value at for a given pair of indices' do
 		expect(cell.value_at_indices(2,0,[[0,0,1],[2,3,4],[5,0,0]])).to eq 5
 	end

 	it 'knows value for a different given pair of indices' do
 		expect(cell.value_at_indices(2,3,[[0,0,1,9],[2,3,4,9],[5,0,0,9]])).to eq 9
 	end

 	it 'returns the values of cells in the same square' do
		grid = [[0,0,1,9],[2,3,4,9],[5,0,0,9]]
		expect(cell.values_in_same_square grid).to eq [0, 0, 1, 2, 3, 4, 5, 0, 0]
	end

	it 'returns the values of cells in same square, different example' do
		cell = Cell.new(7,2,8)
		grid = [[0,0,1,9,3,4,7,7,7],[2,3,4,9,3,4,7,7,7],[5,0,0,9,3,4,7,7,7]]
		expect(cell.values_in_same_square grid).to eq [7, 7, 7, 7, 7, 7, 7, 7, 7]
	end

	it 'can tell it\'s neighbours include 5' do
		grid = [[0,0,1],[2,3,4],[5,0,0]]
		expect(cell.get_values_of_neighbours_from(grid).include?(5)).to be_true
	end

	it 'can tell candidate values' do
		grid_object = double :grid, cells: [[0,0,1,9],[2,3,4,7],[5,0,0,8]]
		expect(cell.candidates grid_object).to eq [6,7,8]
	end

	it 'can tell candidate values, different example' do
		cell = Cell.new(0,2,0)
		grid_object = double :grid, cells: [[5,3,2],[0,0,1],[0,6,0],[3,7,8]]
		expect(cell.candidates grid_object).to eq [4,7,8,9]
	end

	it 'cleans up array by removing zeros and duplicates' do
		values = [0,0,0,6,6,7,8,8]
		expect(cell.clean_up values).to eq [6,7,8]
	end

###

	# it 'test on get_values_of_neighbours_from method' do
	# 	grid_object = double :grid, cells: [[0,0,1],[2,3,4],[5,0,0]]
	# 	expect(cell.get_values_of_neighbours_from grid_object).to eq [[0,0,1],[0,2,5]]
	# end

	
end