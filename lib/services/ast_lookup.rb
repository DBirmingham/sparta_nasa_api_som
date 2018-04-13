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
end

# var = LookupService.new
# puts var.get_asteroid '2000433'