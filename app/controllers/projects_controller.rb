class ProjectsController < ApplicationController
	before_action :require_login, except: :index
	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
		@rewards = @project.rewards
	end

	def new
		# you must be required to logged in to create a new projects.  You will be directed into the login page.
		require_login
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		# @project.owner = "1" # Temporary until we have current_user

		if @project.save
			redirect_to projects_path
		else
			render :new
		end
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :start_date, :end_date, :funding_goal)
	end

end
