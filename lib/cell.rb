class Cell

	def initialize
		@value = nil
	end

	def filled_out?
		0
	end

	def candidates
		[]
	end

	def neighbours grid
		grid.cells
		[]
	end




end