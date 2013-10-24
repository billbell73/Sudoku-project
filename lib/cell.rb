class Cell

	def initialize(value, y_coordinate, x_coordinate)
		@value = value
		@y_coordinate = y_coordinate
		@x_coordinate = x_coordinate
	end

	attr_accessor :value

	def filled_out?
		@value != 0
	end

	def solve grid_object
    unless filled_out?
			grid = get_grid_from grid_object
    # request the list of candidates and 
    # get a new value if there's only one possible candidate
  	end
	end

	def get_grid_from grid_object
		grid_object.cells
	end

	def candidates grid
		# grid = get_grid_from grid_object
		neighbours_values = get_values_of_neighbours_from grid
		(1..9).to_a - neighbours_values
	end

	def only_one_candidate? grid
		candidates(grid).length == 1
	end

	def get_values_of_neighbours_from grid
		neighbours_values = []
		neighbours_values.concat(values_in_same_row(grid))     
		neighbours_values.concat(values_in_same_column(grid))
		neighbours_values.concat(values_in_same_square(grid))
		clean_up neighbours_values
	end

#not sure this method is necessary - line 16 seems to do job anyway
	def clean_up neighbours_values
		neighbours_values.delete(0)
		neighbours_values.uniq!
		neighbours_values
	end

	def values_in_same_row grid
		grid[@y_coordinate]
	end

	def values_in_same_column grid
		grid.transpose[@x_coordinate]
	end

	def sudoku_square_number_of_cell
		(@x_coordinate/3) + ((@y_coordinate/3)*3)
	end

	def sudoku_square_number_of y_coordinate, x_coordinate
		(x_coordinate/3) + ((y_coordinate/3)*3)
	end

	def indices_of_cells_in_same_square
		indices_of_square_mates = []
		(0..8).each do | y_coordinate |
			(0..8).each do | x_coordinate |
				if sudoku_square_number_of(y_coordinate, x_coordinate) == sudoku_square_number_of_cell
					indices_of_square_mates << [y_coordinate, x_coordinate]
				end
			end
		end
		indices_of_square_mates
	end

	def value_at_indices y_coordinate, x_coordinate, grid
		grid[y_coordinate][x_coordinate]
	end

	def values_in_same_square grid
		values_in_same_square = []
		indices_of_cells_in_same_square.each do | coordinates_array | 
	  	x_coordinate = coordinates_array.pop
	  	y_coordinate = coordinates_array.pop
			values_in_same_square << value_at_indices(y_coordinate, x_coordinate, grid)
		end
		values_in_same_square
	end
	
end