class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @new_items = Item.create(item_params)
    @cars = Car.find_by_id(item_params[:car_id])
    @cars.item_order << "," + @new_items.id.to_s if @cars.item_order
    @cars.save
    if @cars.item_order.present?
      item_order = @cars.item_order.split(",")
    else
      item_order = @cars.item_order = @new_items.id.to_s
    end
    @items = @cars.items.where(id: item_order).order(['field(id, ?)', item_order])
  end

  def edit
    @items = Item.find_by_id(params[:id])
  end

  def update
    @items = Item.find_by_id(params[:id])
    @items.update(item_params)
  end

  def destroy
    @items = Item.find_by_id(params[:id])
    @items.destroy
  end

  private

  def item_params
    params[:item].permit(
      :desc,
      :item_type,
      :car_id,
      :title,
      :link_url,
      :image,
      :remote_image_url
    )
  end
end
