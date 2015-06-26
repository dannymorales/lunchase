class SessionsController < ApplicationController

	def new
		
	end

	def create
		@location = Location.last
		session[:address] = @location.address
	end
end
