class Cell

	def initialize(value, y_coordinate, x_coordinate)
		@value = value
		@y_coordinate = y_coordinate
		@x_coordinate = x_coordinate
	end

	def filled_out?
		@value
	end

	def candidates grid_object
		grid = get_grid_for grid_object
		[]
	end

	def neighbours grid
		neighbours_values = []
		neighbours_values.concat(values_in_same_row(grid))     
		neighbours_values.concat(values_in_same_column(grid))
		neighbours_values.concat(values_in_same_square(grid))
	end

	def get_grid_for grid_object
		grid_object.cells
	end

	def values_in_same_row grid
		grid[@y_coordinate]
	end

	def values_in_same_column grid
		grid.transpose[@x_coordinate]
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
	
	def value_at_indices y_coord, x_coord, grid
		grid[y_coord][x_coord]
	end


	def indices_of_cells_in_same_square
		indices_of_square_mates = []
		(0..8).each do | y_coordinate |
			(0..8).each do | x_coordinate |
				if square_number_of(y_coordinate, x_coordinate) == square_number_of_cell
					indices_of_square_mates << [y_coordinate, x_coordinate]
				end
			end
		end
		indices_of_square_mates
	end

	def square_number_of_cell
		(@x_coordinate/3) + ((@y_coordinate/3)*3)
	end

	def square_number_of y_coordinate, x_coordinate
		(x_coordinate/3) + ((y_coordinate/3)*3)
	end


end