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
end

# var = BrowseService.new
# puts var.browse