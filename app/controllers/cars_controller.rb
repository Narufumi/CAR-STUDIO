class CarsController < ApplicationController
  before_action :set_cars, only: [
    :edit,
    :update,
    :destroy,
    :show,
    :save
  ]

  def index
    @search = Car.order("id desc").ransack(params[:q])
    if params[:maker_id].present?
      @makers = Maker.find(params[:maker_id])
      @cars = @makers.cars.order("id desc").page(params[:page])
    elsif params[:body_type_id].present?
      @body_type = BodyType.find(params[:body_type_id])
      @cars      = @body_type.cars.order("id desc").page(params[:page])
    else
      @cars = @search.result(distinct: true).page(params[:page])
      @makers = @cars.first.maker if @cars != []
    end
  end

  def show
    @items = @cars.items
    if @items.present?
      item_order = @cars.item_order.split(",") if @cars.item_order
      @items = @cars.items.where(id: item_order).order(['field(id, ?)', item_order])
    end
    @equipments = @cars.equipments
  end

  def new
    # todo: 本来user_idは自動設定されるはずだが、されないので修正したい
    @new_cars = Car.create(user_id: current_user.id, maker_id: 1, car_type_id: 1)
    @new_cars = Car.new(user_id: current_user.id, maker_id: 1, car_type_id: 1).save(:validate => false)
    @cars     = Car.last
    redirect_to edit_car_path(@cars)
  end

  def edit
    @items = @cars.items.order("id desc")
    if @items.present?
      item_order = @cars.item_order.split(",") if @cars.item_order
      @items = @cars.items.where(id: item_order).order(['field(id, ?)', item_order])
    end
  end

  def update
    @cars.update(car_params)
    redirect_to edit_car_path(@cars)
  end

  def destroy
  end

  def save
    @cars.update(item_order: params[:item_order])
    redirect_to edit_car_path(@cars.id)
  end

  def add_text
    @car_id = params[:id]
    @items = Item.new(item_type: "text")
  end

  def add_header
    @car_id = params[:id]
    @items = Item.new(item_type: "header")
  end

  def add_quote
    @car_id = params[:id]
    @items = Item.new(item_type: "quote")
  end

  def add_button
    @car_id = params[:id]
    @items = Item.new(item_type: "button")
  end

  def add_image
    @car_id = params[:id]
    @items = Item.new(item_type: "image")
  end

  def set_cars
    @cars = Car.find(params[:id])
  end

  def car_params
    params[:car].permit(
      :name,
      :desc,
      :item_order,
      :image,
      :remote_image_url,
      :base_price,
      :total_price,
      :model_year,
      :mileage,
      :displacement,
      :vehicle_inspection,
      :repaired,
      :url,
      :maker_id,
      :car_name,
      :remote_image_url,
      :district,
      :region,
      :store_name,
      :car_type_id
    )
  end
end



