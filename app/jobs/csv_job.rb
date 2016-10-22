require 'csv'

# class ExportJob < ProgressJob::Base
#   def initialize(video_properties, progress_max)
#     super progress_max: progress_max
#     @video_properties = video_properties
#   end

#   def perform

	class CsvJob < ApplicationJob
	  queue_as :default

		def perform(access_token)
		  account = Yt::Account.new(access_token: access_token)
	 
		  duration = account.videos.map do |video|
	      video.public? ? video.duration : 0
		  end
			
		  csv_string = CSV.generate do |csv|
		    csv << ['total public duration']
		    csv << [duration.sum]
		    csv << [""]
		    csv << ['Title', 'Published', 'Run Time','Captioned?', 'Link', 'HD?', 'Total Views', 'Description']
		    account.videos.each do |video|
		      csv << [video.title, video.published_at, video.duration, video.captioned?, "https://www.youtube.com/watch?v=" + video.id, video.hd?, video.views[:total], video.description]
		    end
		  end
		  return csv_string
		end

end
