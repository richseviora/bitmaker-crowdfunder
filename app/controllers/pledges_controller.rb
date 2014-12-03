class PledgesController < ApplicationController

	def new
		@pledge = Pledge.new()
	end

	def create
		# @pledge = Pledge.new(pledge_params)
		# @pledge.amount = reward.amount	
		# respond_to do |format|
		# 	format.js { render text: 'Hi there' } #allows controller to respond in javascript
		# 	format.html #allows controller to respond to html
		# end
	end

	private
	def pledge_params
		params.require(:pledge).permit(:reward_id) 
	end

end
