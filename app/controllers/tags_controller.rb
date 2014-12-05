class TagsController < ApplicationController
  def show
    if params[:id] =~ /\d+/
      @projects = Project.tagged_with(ActsAsTaggableOn::Tag.find(params[:id]))
    else
      @projects = Project.tagged_with(params[:id])
    end
  end

  def index
    @tags = Project.tag_counts.order(taggings_count: :desc).page(params[:page])
    respond_to :js, :html
  end
end
