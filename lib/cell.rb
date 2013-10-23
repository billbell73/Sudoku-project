class Cell

	def initialize(value, y_coordinate, x_coordinate)
		@value = value
		@y_coordinate = y_coordinate
		@x_coordinate = x_coordinate
	end

	def filled_out?
		@value
	end

	def candidates
		[]
	end

	def neighbours grid_object
		full_grid = get_grid grid_object
		neighbours_values = []
		neighbours_values << (values_in_same_row(full_grid))     
		neighbours_values << (values_in_same_column(full_grid))
	end

	def get_grid grid_object
		grid_object.cells
	end

	def values_in_same_row full_grid
		full_grid[@y_coordinate]
	end

	def values_in_same_column full_grid
		full_grid.transpose[@x_coordinate]
	end

	def values_in_same_square full_grid
		# full_grid.select do |x_coordinate|
		# 	puts x_coordinate
		# 	true

      # x_coordinate.each_index do |y_coordinate|
      	#square_number_of_cell == square_number_of(y_coordinate, x_coordinate)
       #end
    # end
	end

	def square_number_of_cell
		(@x_coordinate/3) + ((@y_coordinate/3)*3)
	end

	def square_number_of y_coordinate, x_coordinate
		(x_coordinate/3) + ((y_coordinate/3)*3)
	end


end