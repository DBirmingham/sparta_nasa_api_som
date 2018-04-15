require 'spec_helper'

describe 'Asteroid browse' do

	context 'return a list of asteroid data' do

		before(:all) do
			@browse_data = NasaAst.new.browse_service
			@browse_data.browse
		end

		it 'should have a links hash' do
			expect(@browse_data.get_links).to be_a Hash
		end

		it 'should have a page data hash' do
			expect(@browse_data.get_page_data).to be_a Hash
		end

		it 'should return the page size as an integer' do
			expect(@browse_data.page_size).to be_a Integer
		end

		it 'should return the number of page elements as an integer' do
			expect(@browse_data.element_count).to be_a Integer
		end

		it 'should return the number of total pages as an integer' do
			expect(@browse_data.page_count).to be_a Integer
		end

		it 'should return the neo reference id as a string' do
			expect(@browse_data.get_ref_id).to be_a String
		end

		it 'should return the page number as an integer' do
			expect(@browse_data.page_no).to be_a Integer
		end

		it 'should return a list of @browse_data.page_size near earth objects in an array' do
			expect(@browse_data.neo_count).to eq @browse_data.page_size
		end

		it 'should have a links hash assigned to a near earth objects' do
			expect(@browse_data.neo_link).to be_a Hash
		end

		it 'should return a name as a string' do
			expect(@browse_data.get_ast_name).to be_a String
		end

		it 'should return a nasa jpl url as a string' do
			expect(@browse_data.get_jpl_url).to be_a String
		end

		it 'should return an absolute magnitude h value as a float' do
			expect(@browse_data.get_abs_mag_h).to be_a Float
		end

		it 'should return an estimated diameter hash with 4 keys' do
			expect(@browse_data.diam_keys.length).to eq 4
		end

		it 'should return both min and max data under each diameter measure' do
			@browse_data.get_est_diam.each do |k, v|
				expect(v.keys).to match_array(["estimated_diameter_min", "estimated_diameter_max"])
			end
		end

		it 'should return both min and max diameter data as floats' do
			@browse_data.get_est_diam.each do |k, v|
				v.values.each do |i|
					expect(i).to be_a Float
				end
			end
		end

		it 'should return a boolean with respect to the potential hazard of the asteroid' do
			expect([true, false]).to include @browse_data.danger?
		end

		it 'should return a close approach dataset within an array' do
			expect(@browse_data.close_approach).to be_a Array
		end

		it 'should have a close approach date string of 10 characters' do
			expect(@browse_data.close_approach_date).to be_a String
			expect(@browse_data.close_approach_date.length).to eq 10
		end

		it 'should return an epoch close approach date as an integer' do
			expect(@browse_data.close_approach_epoch_date).to be_a Integer
		end

		it 'should return a relative velocity hash with the keys kilometers_per_second, kilometers_per_hour and miles_per_hour' do
			expect(@browse_data.rel_velocity_keys).to match_array(["kilometers_per_second", "kilometers_per_hour", "miles_per_hour"])
		end

		it 'should relative velocity values as strings' do
			@browse_data.rel_velocity_values.each do |i|
				expect(i).to be_a String
			end
		end

		it 'should return a miss distance hash with the keys astronomical, lunar, kilometers and miles' do
			expect(@browse_data.miss_distance_keys).to match_array(["astronomical", "lunar", "kilometers", "miles"])
		end

		it 'should return miss distance values as strings' do
			@browse_data.miss_distance_values.each do |i|
				expect(i).to be_a String
			end
		end

		it 'should return an orbiting body string' do
			expect(@browse_data.orbiting).to be_a String
		end

		it 'should return an orbital data hash' do
			expect(@browse_data.orbital_data).to be_a Hash
		end

		it 'should return an orbit determination date as a string' do
			expect(@browse_data.orbit_determination_date).to be_a String
		end

		it 'should return an orbit uncertainty as a string' do
			expect(@browse_data.orbit_uncertainty).to be_a String
		end

		it 'should return an min orbit intersection as a string' do
			expect(@browse_data.min_orbit_intersection).to be_a String
		end

		it 'should return a jupiter tisserand invariant value as a string' do
			expect(@browse_data.jti).to be_a String
		end

		it 'should return an epoch osculation value as a string' do
			expect(@browse_data.epoch_osculation).to be_a String
		end

		it 'should return an eccentricity value as a string' do
			expect(@browse_data.eccentricity).to be_a String
		end

		it 'should return a semi-major axis value as a string' do
			expect(@browse_data.semi_major_axis).to be_a String
		end

		it 'should return an inclination value as a string' do
			expect(@browse_data.inclination).to be_a String
		end

		it 'should return an ascending node longitude value as a string' do
			expect(@browse_data.asc_node_longitude).to be_a String
		end

		it 'should return an orbital period as a string' do
			expect(@browse_data.orbital_period).to be_a String
		end

		it 'should return an orbit id as a string' do
			expect(@browse_data.orbit_id).to be_a String
		end

		it 'should return an orbit id as a string' do
			expect(@browse_data.orbit_id).to be_a String
		end

		it 'should return a perihelion distance as a string' do
			expect(@browse_data.perihelion_dist).to be_a String
		end

		it 'should return a perihelion argument as a string' do
			expect(@browse_data.perihelion_arg).to be_a String
		end

		it 'should return a perihelion time as a string' do
			expect(@browse_data.perihelion_time).to be_a String
		end

		it 'should return an aphelion distance as a string' do
			expect(@browse_data.aphelion_dist).to be_a String
		end

		it 'should return a mean anomaly as a string' do
			expect(@browse_data.mean_anomaly).to be_a String
		end

		it 'should return a mean motion as a string' do
			expect(@browse_data.mean_motion).to be_a String
		end

		it 'should return an equinox value as a string' do
			expect(@browse_data.equinox).to be_a String
		end
	end
end