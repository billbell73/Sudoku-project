require 'grid'


describe Grid do
	let(:grid) { Grid.new }
	
	it 'can remember cells of a grid' do
		expect(grid.cells).to be_instance_of Array
	end

	it 'can solve a puzzle' do
		expect(grid.solve).to be_true
	end
end