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

		it 'should return an estimated diameter hash with 4 keys' do
			expect(@asteroid_data.diam_keys.length).to eq 4
		end

		it 'should return both min and max data under each diameter measure' do
			@asteroid_data.get_est_diam.each do |k, v|
				expect(v.keys).to match_array(["estimated_diameter_min", "estimated_diameter_max"])
			end
		end

		it 'should return both min and max diameter data as floats' do
			@asteroid_data.get_est_diam.each do |k, v|
				v.values.each do |i|
					expect(i).to be_a Float
				end
			end
		end

		it 'should return a boolean with respect to the potential hazard of the asteroid' do
			expect([true, false]).to include @asteroid_data.danger?
		end

		it 'should return a close approach dataset within an array' do
			expect(@asteroid_data.close_approach).to be_a Array
		end

		it 'should have a close approach date string of 10 characters' do
			expect(@asteroid_data.close_approach_date).to be_a String
			expect(@asteroid_data.close_approach_date.length).to eq 10
		end

		it 'should return an epoch close approach date as an integer' do
			expect(@asteroid_data.close_approach_epoch_date).to be_a Integer
		end

		it 'should return a relative velocity hash with the keys kilometers_per_second, kilometers_per_hour and miles_per_hour' do
			expect(@asteroid_data.rel_velocity_keys).to match_array(["kilometers_per_second", "kilometers_per_hour", "miles_per_hour"])
		end

		it 'should relative velocity values as strings' do
			@asteroid_data.rel_velocity_values.each do |i|
				expect(i).to be_a String
			end
		end

		it 'should return a miss distance hash with the keys astronomical, lunar, kilometers and miles' do
			expect(@asteroid_data.miss_distance_keys).to match_array(["astronomical", "lunar", "kilometers", "miles"])
		end

		it 'should return miss distance values as strings' do
			@asteroid_data.miss_distance_values.each do |i|
				expect(i).to be_a String
			end
		end

		it 'should return an orbiting body string' do
			expect(@asteroid_data.orbiting).to be_a String
		end

		it 'should return an orbital data hash' do
			expect(@asteroid_data.orbital_data).to be_a Hash
		end

		it 'should return an orbit determination date as a string' do
			expect(@asteroid_data.orbit_determination_date).to be_a String
		end

		it 'should return an orbit uncertainty as a string' do
			expect(@asteroid_data.orbit_uncertainty).to be_a String
		end

		it 'should return an min orbit intersection as a string' do
			expect(@asteroid_data.min_orbit_intersection).to be_a String
		end

		it 'should return a jupiter tisserand invariant value as a string' do
			expect(@asteroid_data.jti).to be_a String
		end

		it 'should return an epoch osculation value as a string' do
			expect(@asteroid_data.epoch_osculation).to be_a String
		end

		it 'should return an eccentricity value as a string' do
			expect(@asteroid_data.eccentricity).to be_a String
		end

		it 'should return a semi-major axis value as a string' do
			expect(@asteroid_data.semi_major_axis).to be_a String
		end

		it 'should return an inclination value as a string' do
			expect(@asteroid_data.inclination).to be_a String
		end

		it 'should return an ascending node longitude value as a string' do
			expect(@asteroid_data.asc_node_longitude).to be_a String
		end

		it 'should return an orbital period as a string' do
			expect(@asteroid_data.orbital_period).to be_a String
		end

		it 'should return an orbit id as a string' do
			expect(@asteroid_data.orbit_id).to be_a String
		end

		it 'should return an orbit id as a string' do
			expect(@asteroid_data.orbit_id).to be_a String
		end

		it 'should return a perihelion distance as a string' do
			expect(@asteroid_data.perihelion_dist).to be_a String
		end

		it 'should return a perihelion argument as a string' do
			expect(@asteroid_data.perihelion_arg).to be_a String
		end

		it 'should return a perihelion time as a string' do
			expect(@asteroid_data.perihelion_time).to be_a String
		end

		it 'should return an aphelion distance as a string' do
			expect(@asteroid_data.aphelion_dist).to be_a String
		end

		it 'should return a mean anomaly as a string' do
			expect(@asteroid_data.mean_anomaly).to be_a String
		end

		it 'should return a mean motion as a string' do
			expect(@asteroid_data.mean_motion).to be_a String
		end

		it 'should return an equinox value as a string' do
			expect(@asteroid_data.equinox).to be_a String
		end
	end
end