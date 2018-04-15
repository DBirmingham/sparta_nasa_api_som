require 'httparty'
require 'json'

class FeedService
	include HTTParty

	base_uri 'https://api.nasa.gov/neo/rest/v1/'

	def initialize start_date, end_date
		@api_key = 'ftpSYA2QnXH4DeMWUki7eQSmbAP93HAfm2Lvzzx3'
		@start_date = start_date
		@end_date = end_date
	end

	def get_asteroid_by_approach_date
		@feed_data = JSON.parse(self.class.get("/feed?start_date=#{@start_date}&end_date=#{@end_date}&api_key=#{@api_key}").body)
	end

	def day_list(start_date=@start_date, end_date=@end_date)
		array = []
		date = start_date
		until date == end_date do
			array << date.dup
			if (true)
				if date[-5, 5] == '12-31'
				 	date[0, 4] = (date[0, 4].to_i + 1).to_s
				 	date[5, 2] = '00'
				 	date[8, 2] = '00'
				 elsif (date[-5, 5] == '01-31' || date[-5, 5] == '02-28' ||date[-5, 5] == '03-31' ||date[-5, 5] == '04-30' ||date[-5, 5] == '05-31' ||date[-5, 5] == '06-30' ||date[-5, 5] == '07-31' ||date[-5, 5] == '08-31' ||date[-5, 5] == '09-30' ||date[-5, 5] == '10-31' ||date[-5, 5] == '11-30')
				 	date[8, 2] = '00'
				 	if date[5, 2].to_i < 9
				 		date[5, 2] = "0#{(date[5, 2].to_i + 1).to_s}"
				 	else
				 		date[5, 2] = (date[5, 2].to_i + 1).to_s
				 	end
				 else
				 	if date[8, 2].to_i < 9
				 		date[8, 2] = "0#{(date[8, 2].to_i + 1).to_s}"
				 	else
				 		date[8, 2] = (date[8, 2].to_i + 1).to_s
				 	end
				end
			end
		end
		array << @end_date
		array
	end

	def get_links
		@feed_data["links"]
	end

	def element_count
		@feed_data["element_count"]
	end

	def neo
		@feed_data["near_earth_objects"]
	end

	def neo_start_date
		neo["#{@start_date}"]
	end

	def neo_start_date_1
		neo_start_date[0]
	end

	def neo_count
		@feed_data["near_earth_objects"].count
	end

	def neo_link
		neo_start_date_1["links"]
	end

	def get_ref_id
		neo_start_date_1["neo_reference_id"]
	end

	def get_ast_name
		neo_start_date_1["name"]
	end

	def get_jpl_url
		neo_start_date_1["neo_reference_id"]
	end

	def get_abs_mag_h
		neo_start_date_1["absolute_magnitude_h"]
	end

	def get_est_diam
		neo_start_date_1["estimated_diameter"]
	end

	def diam_keys
		neo_start_date_1["estimated_diameter"].keys
	end

	def danger?
		neo_start_date_1["is_potentially_hazardous_asteroid"]
	end

	def close_approach
		neo_start_date_1["close_approach_data"]
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
end

# var = FeedService.new
# puts var.get_asteroid_by_approach_date '2018-04-12', '2018-04-13'