require 'httparty'
require 'json'

class LookupService
	include HTTParty

	base_uri 'https://api.nasa.gov/neo/rest/v1/neo'

	def initialize
		@api_key = 'ftpSYA2QnXH4DeMWUki7eQSmbAP93HAfm2Lvzzx3'
	end

	def get_asteroid small_body_id
		@asteroid_data = JSON.parse(self.class.get("/#{small_body_id}?api_key=#{@api_key}").body)
	end

	def get_ref_id
		@asteroid_data["neo_reference_id"]
	end

	def get_ast_name
		@asteroid_data["name"]
	end

	def get_jpl_url
		@asteroid_data["neo_reference_id"]
	end

	def get_abs_mag_h
		@asteroid_data["absolute_magnitude_h"]
	end

	def get_est_diam
		@asteroid_data["estimated_diameter"]
	end

	def diam_keys
		@asteroid_data["estimated_diameter"].keys
	end

	def danger?
		@asteroid_data["is_potentially_hazardous_asteroid"]
	end

	def close_approach
		@asteroid_data["close_approach_data"]
	end

	def close_approach_date
		close_approach[0]["close_approach_date"]
	end

	def close_approach_epoch_date
		close_approach[0]["epoch_date_close_approach"]
	end

	def get_rel_velocity
		close_approach[0]["relative_velocity"]
	end

	def rel_velocity_keys
		get_rel_velocity.keys
	end

	def rel_velocity_values
		get_rel_velocity.values
	end

	def miss_distance
		close_approach[0]["miss_distance"]
	end

	def miss_distance_keys
		miss_distance.keys
	end

	def miss_distance_values
		miss_distance.values
	end

	def orbiting
		close_approach[0]["orbiting_body"]
	end

	def orbital_data
		@asteroid_data["orbital_data"]
	end

	def orbit_id
		orbital_data["orbit_id"]
	end

	def orbit_determination_date
		orbital_data["orbit_determination_date"]
	end

	def orbit_uncertainty
		orbital_data["orbit_uncertainty"]
	end

	def min_orbit_intersection
		orbital_data["minimum_orbit_intersection"]
	end

	def jti
		orbital_data["jupiter_tisserand_invariant"]
	end

	def epoch_osculation
		orbital_data["epoch_osculation"]
	end

	def eccentricity
		orbital_data["eccentricity"]
	end

	def semi_major_axis
		orbital_data["semi_major_axis"]
	end

	def inclination
		orbital_data["inclination"]
	end

	def asc_node_longitude
		orbital_data["ascending_node_longitude"]
	end

	def orbital_period
		orbital_data["orbital_period"]
	end

	def perihelion_dist
		orbital_data["perihelion_distance"]
	end

	def perihelion_arg
		orbital_data["perihelion_argument"]
	end

	def perihelion_time
		orbital_data["perihelion_time"]
	end

	def aphelion_dist
		orbital_data["aphelion_distance"]
	end

	def mean_anomaly
		orbital_data["mean_anomaly"]
	end

	def mean_motion
		orbital_data["mean_motion"]
	end

	def equinox
		orbital_data["equinox"]
	end


end

# var = LookupService.new
# puts var.get_asteroid '2000433'