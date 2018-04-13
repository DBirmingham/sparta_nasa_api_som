require 'spec_helper'

describe 'Asteroid lookup' do

	context 'requesting asteroid information based on SPK-ID' do

		before(:all) do
			@ast_id = '2000433'
			@asteroid_data = NasaAst.new.lookup_service
			@asteroid_data.get_asteroid @ast_id
			p @asteroid_data
		end

		it 'should return a hash' do
			expect(@asteroid_data).to be_a Hash
		end

		it 'should have a reference ID matching the given SPK-ID' do
			expect(@asteroid_data.get_ref_id).to eq @ast_id
		end

		it 'should have a name string' do
			expect(@asteroid_data.get_ast_name).to be_a String
		end

	end
end