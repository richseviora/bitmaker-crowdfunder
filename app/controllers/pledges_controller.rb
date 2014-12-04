class PledgesController < ApplicationController

	def create
		# putting @project so @project will be binded to the create method
		# now you can use @project in the projects/_individual_project.html.erb
		@project = Project.find(params[:project_id])
		@pledge = Pledge.new(reward: Reward.find(params[:reward_id]))
		@pledge.user = current_user
		@pledge.amount = Reward.find(params[:reward_id]).amount
		#assigning the pledge to the project
		@pledge.project = @project
		@pledge.save

		respond_to do |format|
      		format.js   # create.js.erb, allows controller to respond to JavaScript
      		format.html { redirect_to project_url(params[:project_id]) }# create.html.erb
    	end
	end
end
