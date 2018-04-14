require 'httparty'
require 'json'

class BrowseService
	include HTTParty

	base_uri 'https://api.nasa.gov/neo/rest/v1/neo/browse'

	def initialize
		@api_key = 'ftpSYA2QnXH4DeMWUki7eQSmbAP93HAfm2Lvzzx3'
	end

	def browse
		@browse_data = JSON.parse(self.class.get("?api_key=#{@api_key}").body)
	end

	def get_links
		@browse_data["links"]
	end

	def get_page_data
		@browse_data["page"]
	end

	def page_size
		get_page_data["size"]
	end

	def element_count
		get_page_data["total_elements"]
	end

	def page_count
		get_page_data["total_pages"]
	end

	def page_no
		get_page_data["number"]
	end

	def neo1
		@browse_data["near_earth_objects"][0]
	end

	def neo_count
		@browse_data["near_earth_objects"].count
	end

	def neo_link
		neo1["links"]
	end

	def get_ref_id
		neo1["neo_reference_id"]
	end

	def get_ast_name
		neo1["name"]
	end

	def get_jpl_url
		neo1["neo_reference_id"]
	end

	def get_abs_mag_h
		neo1["absolute_magnitude_h"]
	end

	def get_est_diam
		neo1["estimated_diameter"]
	end

	def diam_keys
		neo1["estimated_diameter"].keys
	end

	def danger?
		neo1["is_potentially_hazardous_asteroid"]
	end

	def close_approach
		neo1["close_approach_data"]
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
		neo1["orbital_data"]
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

# var = BrowseService.new
# puts var.browse