class PledgesController < ApplicationController

	def create
		@pledge = Pledge.new(reward: Reward.find(params[:reward_id]))
		# ensure that the pledge user is the current user
		@pledge.user = current_user
		# find the reward based on current :reward_id
		@pledge.amount = Reward.find(params[:reward_id]).amount
		@pledge.save
<<<<<<< HEAD

		 respond_to do |format|
		 	format.js  #allows controller to respond in javascript
		 	format.html { redirect_to project_url(params[:project_id]) } #allows controller to respond to html
		 end

=======

		respond_to do |format|
      		format.html # create.html.erb
      		format.js   # create.js.erb, allows controller to respond to JavaScript
    	end
>>>>>>> origin/mchau
	end
end
