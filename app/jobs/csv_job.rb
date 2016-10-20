require 'csv'

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
	    csv << ['title', 'captioned?']
	    account.videos.each do |video|
	      csv << [video.title, video.captioned?]
	    end
	  end
	  return csv_string
	end

end