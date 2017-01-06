class CategoriesController < ApplicationController
  def index
  end

  def show
    @search = Car.ransack(params[:q])

    params[:id].present? ? @categorys = Category.find(params[:id]) : @categorys = Category.find(1)
    @maker = @categorys.makers.limit(20)
    @body_type = @categorys.body_types
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end
end
