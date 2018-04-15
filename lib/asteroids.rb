require_relative 'services/ast_browse'
require_relative 'services/ast_feed'
require_relative 'services/ast_lookup'

class NasaAst
	def lookup_service
		LookupService.new
	end

	def feed_service start_date, end_date
		FeedService.new start_date, end_date
	end

	def browse_service
		BrowseService.new
	end
end