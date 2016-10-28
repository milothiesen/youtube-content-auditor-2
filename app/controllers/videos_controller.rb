class VideosController < ApplicationController
	
	def index
	  @account = Yt::Account.new(authorization_code: params[:code], redirect_uri: ENV['YT_REDIRECT_URI']) if params[:code].present?
	end

	def csv
	# 	# @Job = Delayed::Job.enqueue CsvJob.new(params[:access_token])
		CsvWorker.perform_async
		send_data CsvJob.perform_now(params[:access_token]), filename:"report.csv"
	# 	# if params[:code].present?
	#  #    	account = Yt::Account.new(authorization_code: params[:code], redirect_uri: ENV['YT_REDIRECT_URI'])
	#  #    	send_data CsvJob.perform_now(account.access_token), filename:"report.csv"
	#  #    	# send_data CsvJob.perform_now("ya29.Ci-CA3_3X3K_wrcdBk1jSq1oFNQGinft-suFBqoqCDwEogQNaWhjm8j750ofT2aEhQ"), filename: "youtube-report.csv" if params[:code].present?
	#  #  	end
	end





end
