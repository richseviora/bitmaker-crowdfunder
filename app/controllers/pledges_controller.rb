class PledgesController < ApplicationController

	def create
		@pledge = Pledge.new(reward: Reward.find(params[:reward_id]))
		@pledge.user = current_user
		@pledge.amount = Reward.find(params[:reward_id]).amount
		@pledge.save

		# respond_to do |format|
  #     		format.html # index.html.erb
  #     		format.js   # index.js.erb, allows controller to respond to JavaScript
  #   	end
	end
end
