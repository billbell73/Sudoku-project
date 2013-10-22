require 'cell'


describe Cell do
	let(:cell) { Cell.new }
	let(:grid) {double :grid}

	it 'knows if it\'s filled out' do
		expect(cell.filled_out?).to be_instance_of Fixnum
	end

	it 'can tell candidate numbers when empty' do
		expect(cell.candidates).to be_instance_of Array
	end

	it 'can tell it\'s neighbours' do
		grid = double :grid, cells: :banana
		expect(cell.neighbours grid).to be_instance_of Array
	end

	it 'can tell it\s neighbours include 5' do
		expect(grid).to receive(:cells)
		cell.neighbours grid
	end



end