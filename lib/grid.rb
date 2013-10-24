require_relative 'cell'

class Grid

	attr_reader :cells
	attr_accessor :grid

	# @@cell_refs = []


	def initialize(initial_values)
		@grid = create_grid_from initial_values
		@cells = []
		create_cells_from @grid
  end

  

  def create_grid_from puzzle
  	counter = 0
  	grid = Array.new(9) { Array.new(9) }
		(0..8).each do | y_coordinate |
			(0..8).each do | x_coordinate |
				grid[y_coordinate][x_coordinate] = puzzle[counter].to_i
				counter += 1
			end
		end
		grid
  end

  def create_cells_from grid
  	(0..8).each do | y_coordinate |
			(0..8).each do | x_coordinate |
				value = @grid[y_coordinate][x_coordinate]
				new_cell = Cell.new(value, y_coordinate, x_coordinate)
				@cells << new_cell#.dup
			end
		end
  end

  def solve
    outstanding_before, looping = false
    while !solved? && !looping
      try_to_solve
      outstanding = @cells.count {|c| c.filled_out? }
      looping = outstanding_before == outstanding       
      outstanding_before = outstanding     
    end 
  end

  def try_to_solve
  	#ask each cell to solve itself
  	@cells.each { |cell| cell.solve(self, @grid) }
  	# @cells.each { |cell| p cell }
  end

  def solved?
    @cells.all? { |cell| cell.filled_out? }
  end

  def inspect
    p @grid
  end


end

