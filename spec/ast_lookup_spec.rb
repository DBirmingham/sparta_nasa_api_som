require 'spec_helper'

describe 'Asteroid lookup' do

	context 'requesting asteroid information based on SPK-ID' do

		before(:all) do
			@ast_id = '2000433'
			@asteroid_data = NasaAst.new.lookup_service
			@asteroid_data.get_asteroid @ast_id
		end

		# it 'should return a hash' do
		# 	expect(@asteroid_data).to be_a Hash
		# end

		it 'should have a reference ID matching the given SPK-ID' do
			expect(@asteroid_data.get_ref_id).to eq @ast_id
		end

		it 'should return a name as a string' do
			expect(@asteroid_data.get_ast_name).to be_a String
		end

		it 'should return a nasa jpl url as a string' do
			expect(@asteroid_data.get_jpl_url).to be_a String
		end

		it 'should return an absolute magnitude h value as a float' do
			expect(@asteroid_data.get_abs_mag_h).to be_a Float
		end

		it 'should return an estimated diameter hash' do
			expect(@asteroid_data.get_est_diam).to be_a Hash
		end

		it 'should return an estimated diameter hash with 4 keys' do
			expect(@asteroid_data.diam_keys.length).to eq 4
		end

		it 'should return both min and max data under each diameter measure' do
			@asteroid_data.get_est_diam.each do |k, v|
				expect(v.keys).to match_array(["estimated_diameter_min", "estimated_diameter_max"])
			end
		end

	end
end