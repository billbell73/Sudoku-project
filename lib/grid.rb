class Grid

attr_reader :cells

	@@cell_refs = []


	def initialize(initial_values)
		@cells = # generate 81 cells...
		@initial_values = initial_values
  end

  

  def array_creator
  	# takes in string and returns 9x9 array
  end

  def cell_creator grid
  	# takes in string and creates cells with value and coord
  	# and returns ref to class variable? Instance variable?
  end

  def solve
    outstanding_before, looping = SIZE, false
    while !solved? && !looping
      try_to_solve
      outstanding = @cells.count {|c| c.solved? }
      looping = outstanding_before == outstanding       
      outstanding_before = outstanding     
    end 
  end

  def try_to_solve
  	# ask each cell to solve itself
  end

  def solved?
    # a grid is solved if all cells are filled out. Use .all? method
  end

  def inspect
    # iterate over all cells and print the grid
  end


end

