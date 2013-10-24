require 'grid'


describe Grid do

	let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
  let(:grid) { Grid.new(puzzle) }

  it 'can take in 81 character string and create 9x9 Array' do
  	expect(grid.create_grid_from(puzzle)[0][1]).to eq 1
  end

	context "initialization" do
    
    it 'should have 81 cells' do
    	grid_object = Grid.new(puzzle)
    	new_grid = grid_object.create_grid_from(puzzle)
    	expect(grid_object.cells.length).to eq 81
    end

    xit 'should have an unsolved first cell' do
    end

    xit 'should have a solved second cells with value 1' do
    end

    xit 'can see Cell class' do

    end

  end


  context "solving sudoku" do

  	it 'can ask a cell to solve itself' do
  	end

		xit "can solve the puzzle" do
      expect(grid.solved?).to be_false
      grid.solve
      expect(grid.solved?).to be_true
      expect(grid.to_s).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
    end

  end

end

