require 'cell'


describe Cell do
	let(:cell) { Cell.new(0,0,0) }
	
	let(:grid) { double :grid }

	it 'knows if it\'s filled out' do
		expect(cell.filled_out?).to be_true
	end

	it 'can tell candidate numbers when empty' do
		expect(cell.candidates).to be_instance_of Array
	end

	it 'can tell it\'s neighbours' do
		grid = double :grid, cells: [], transpose: :banana
		expect(cell.neighbours grid).to be_instance_of Array
	end

	it 'can get the full grid' do
		expect(grid).to receive(:cells)
		cell.get_grid grid
	end

	it 'returns the values of cells in the same row' do
		full_grid = [[0,0,1],[2,3,4],[5,0,0]]
		expect(cell.values_in_same_row full_grid).to eq [0,0,1]
	end

	it 'returns the values of cells in the same column' do
		full_grid = [[0,0,1],[2,3,4],[5,0,0]]
		expect(cell.values_in_same_column full_grid).to eq [0,2,5]
	end

	it 'can tell its square number if it is at index [0][0]' do
		expect(cell.square_number_of_cell).to eq 0
	end

	it 'can tell its square number if it is at index [7][1]' do
		cell = Cell.new(0, 7, 1)
		expect(cell.square_number_of_cell).to eq 6
	end

	it 'can tell its square number if it is at index [5][8]' do
		cell = Cell.new(0, 5, 8)
		expect(cell.square_number_of_cell).to eq 5
	end

	it 'can tell square number for given x and y co-ordinates' do
		expect(cell.square_number_of 5, 3).to eq 4
	end

	xit 'returns the values of cells in the same square' do
		full_grid = [[0,0,1,9],[2,3,4,9],[5,0,0,9]]
		expect(cell.values_in_same_square full_grid).to eq [[0,0,1],[2,3,4],[5,0,0]]
	end

	it 'returns x indices of cells in same square' do
		expect(cell.indices_of_cells_in_same_square).to eq []
	end









###

	it 'test on neighbours method' do
		grid_object = double :grid, cells: [[0,0,1],[2,3,4],[5,0,0]]
		expect(cell.neighbours grid_object).to eq [[0,0,1],[0,2,5]]
	end

	xit 'can tell it\'s neighbours include 5' do

		# expect(neighbour_finder grid).to return Array
	end

end