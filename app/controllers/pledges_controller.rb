class PledgesController < ApplicationController

	def create
		@pledge = Pledge.new(reward: Reward.find(params[:reward_id]))
		@pledge.user = current_user
		@pledge.amount = Reward.find(params[:reward_id]).amount
		@pledge.save

		respond_to do |format|
      		format.html # create.html.erb
      		format.js   # create.js.erb, allows controller to respond to JavaScript
    	end
	end
end
