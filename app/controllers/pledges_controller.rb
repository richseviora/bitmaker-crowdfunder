class PledgesController < ApplicationController

	def new
		@pledge = Pledge.new()
	end

	def create
		@pledge = Pledge.new(reward: Reward.find(params[:reward_id]))
		# ensure that the pledge user is the current user
		@pledge.user = current_user
		# find the reward based on current :reward_id
		@pledge.amount = Reward.find(params[:reward_id]).amount
		@pledge.save

		 respond_to do |format|
		 	format.js { render text: 'Hi there' } #allows controller to respond in javascript
		 	format.html #allows controller to respond to html
		 end
	end

	

end
