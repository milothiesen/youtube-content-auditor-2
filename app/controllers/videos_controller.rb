class VideosController < ApplicationController
	
	
	def new
		@account = Account.find(params[:account_id])
		@video = Video.new
	end

	def index
	  @account = Yt::Account.new(authorization_code: params[:code], redirect_uri: ENV['YT_REDIRECT_URI']) if params[:code].present?
	end

	def csv
		CsvWorker.perform_async
		send_data CsvJob.perform_now(params[:access_token]), filename:"report.csv"
	end





end
