class Cell

	def initialize(value, row, column)
		@value = value
		@row = row
		@column = column
	end

	def filled_out?
		@value
	end

	def candidates
		[]
	end

	def neighbours grid_object
		full_grid = get_grid grid_object
		#logic which iterates through array choosing cells in same array and cells at same index in other array
		neighbours_values = []
		neighbours_values << (values_in_same_row(full_grid))        #full_grid[@row]
	end

	def get_grid grid_object
		grid_object.cells
	end

	# #pass full_grid and POSITION?? and works out neighbours
	# def neighbour_finder full_grid
	# 	# neighbours_values = []
	# 	# neighbours_values << full_grid[0]
	# end

	def values_in_same_row full_grid
		full_grid[@row]
	end



end