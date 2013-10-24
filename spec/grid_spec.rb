require 'grid'


describe Grid do

	let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
  let(:grid_object) { Grid.new(puzzle) }

  it 'can take in 81 character string and create 9x9 Array' do
  	expect(grid_object.create_grid_from(puzzle)[0][1]).to eq 1
  end

	context "initialization" do
    
    it 'should have 81 cells' do
    	# grid_object = Grid.new(puzzle)
    	# new_grid = grid_object.create_grid_from(puzzle)
    	expect(grid_object.cells.length).to eq 81
    end

    it 'should have an unsolved first cell' do
    	expect(grid_object.cells[0].value).to eq 0
    end

    it 'should have a solved second cell with value 1' do
    	expect(grid_object.cells[1].value).to eq 1
    end

  end


  context "solving sudoku" do

  	it 'can ask a cell to solve itself' do
  		grid_object = Grid.new(puzzle)
  		grid_object.try_to_solve
  	end

  	it 'can tell if some cells are unsolved' do
  		grid_object = Grid.new(puzzle)
  		expect(grid_object.solved?).to be_false
  	end

  	it 'can tell if all cells are solved' do
  		grid_object = Grid.new('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
  		expect(grid_object.solved?).to be_true
  	end

  	xit 'can print the grid' do
  		expect(grid_object.inspect).to be_instance_of Array
  	end 

		it "can solve the puzzle" do
      expect(grid_object.solved?).to be_false
      grid_object.solve
      expect(grid_object.solved?).to be_true
      expect(grid_object.grid.join).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
    end

  end

end

