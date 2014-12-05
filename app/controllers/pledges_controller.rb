class PledgesController < ApplicationController

	def create
		# putting @project so @project will be binded to the create method
		# now you can use @project in the projects/_individual_project.html.erb
		@project = Project.find(params[:project_id])
		@pledge = Pledge.new(reward: Reward.find(params[:reward_id]))
		# ensure that the pledge user is the current user
		@pledge.user = current_user
		# find the reward based on current :reward_id
		@pledge.amount = Reward.find(params[:reward_id]).amount
		#assigning the pledge to the project
		@pledge.project = @project

		@pledge.save

		 respond_to do |format|
		 	format.js  #allows controller to respond in javascript
		 	format.html { redirect_to project_url(params[:project_id]) } #allows controller to respond to html and sends it back to the correct project
		 end
	end
end
