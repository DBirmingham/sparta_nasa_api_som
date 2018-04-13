require 'httparty'
require 'json'

class FeedService
	include HTTParty

	base_uri 'https://api.nasa.gov/neo/rest/v1/'

	def initialize
		@api_key = 'ftpSYA2QnXH4DeMWUki7eQSmbAP93HAfm2Lvzzx3'
	end

	def get_asteroid_by_approach_date start_date, end_date
		@asteroid_data = JSON.parse(self.class.get("/feed?start_date=#{start_date}&end_date=#{end_date}&api_key=#{@api_key}").body)
	end
end

# var = FeedService.new
# puts var.get_asteroid_by_approach_date '2018-04-12', '2018-04-13'