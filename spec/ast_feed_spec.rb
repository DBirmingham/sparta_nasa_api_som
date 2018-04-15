require 'spec_helper'

describe 'Asteroid Feed' do

	context 'return a list of asteroid data' do

		before(:all) do
			@start_date = '2018-04-12'
			@end_date = '2018-04-14'
			@feed_data = NasaAst.new.feed_service @start_date, @end_date
			@feed_data.get_asteroid_by_approach_date
		end

		it 'should have a links hash' do
			expect(@feed_data.get_links).to be_a Hash
		end

		it 'should have an element count given as an Integer' do
			expect(@feed_data.element_count).to be_a Integer
		end

		it 'should return a hash of near earth objects' do
			expect(@feed_data.neo).to be_a Hash
		end

		it 'should list near earth objects by date in an array' do
			expect(@feed_data.neo_start_date).to be_a Array
		end

		it 'should only return dates within the specified range' do
			expect(@feed_data.day_list).to match_array(@feed_data.neo.keys)
		end

		it 'should have a links hash assigned to the date' do
			expect(@feed_data.neo_link).to be_a Hash
		end

		it 'should return the neo reference id as a string' do
			expect(@feed_data.get_ref_id).to be_a String
		end

		it 'should return a name as a string' do
			expect(@feed_data.get_ast_name).to be_a String
		end

		it 'should return a nasa jpl url as a string' do
			expect(@feed_data.get_jpl_url).to be_a String
		end

		it 'should return an absolute magnitude h value as a float' do
			expect(@feed_data.get_abs_mag_h).to be_a Float
		end

		it 'should return an estimated diameter hash with 4 keys' do
			expect(@feed_data.diam_keys.length).to eq 4
		end

		it 'should return both min and max data under each diameter measure' do
			@feed_data.get_est_diam.each do |k, v|
				expect(v.keys).to match_array(["estimated_diameter_min", "estimated_diameter_max"])
			end
		end

		it 'should return both min and max diameter data as floats' do
			@feed_data.get_est_diam.each do |k, v|
				v.values.each do |i|
					expect(i).to be_a Float
				end
			end
		end

		it 'should return a boolean with respect to the potential hazard of the asteroid' do
			expect([true, false]).to include @feed_data.danger?
		end

		it 'should return a close approach dataset within an array' do
			expect(@feed_data.close_approach).to be_a Array
		end

		it 'should have a close approach date string of 10 characters' do
			expect(@feed_data.close_approach_date).to be_a String
			expect(@feed_data.close_approach_date.length).to eq 10
		end

		it 'should return an epoch close approach date as an integer' do
			expect(@feed_data.close_approach_epoch_date).to be_a Integer
		end

		it 'should return a relative velocity hash with the keys kilometers_per_second, kilometers_per_hour and miles_per_hour' do
			expect(@feed_data.rel_velocity_keys).to match_array(["kilometers_per_second", "kilometers_per_hour", "miles_per_hour"])
		end

		it 'should relative velocity values as strings' do
			@feed_data.rel_velocity_values.each do |i|
				expect(i).to be_a String
			end
		end

		it 'should return a miss distance hash with the keys astronomical, lunar, kilometers and miles' do
			expect(@feed_data.miss_distance_keys).to match_array(["astronomical", "lunar", "kilometers", "miles"])
		end

		it 'should return miss distance values as strings' do
			@feed_data.miss_distance_values.each do |i|
				expect(i).to be_a String
			end
		end

		it 'should return an orbiting body string' do
			expect(@feed_data.orbiting).to be_a String
		end
	end
end