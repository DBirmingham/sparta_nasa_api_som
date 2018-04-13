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
end

# var = LookupService.new
# puts var.get_asteroid '2000433'