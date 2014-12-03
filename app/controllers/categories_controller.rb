class CategoriesController < ApplicationController
  def index

    @categories = Category.order(:name).page(params[:page])

    respond_to :html, :js
  end

  def show
    @category = Category.find(params[:id])
  end
end
