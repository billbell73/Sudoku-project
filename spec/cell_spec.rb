require 'cell'


describe Cell do
	let(:cell) { Cell.new }

	it 'knows if it\'s filled out' do
		expect(cell.filled_out?).to be_instance_of Fixnum
	end

end