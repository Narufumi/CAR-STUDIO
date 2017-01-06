class ArticlesController < ApplicationController
  before_action :set_articles, only: [
    :edit,
    :update,
    :destroy,
    :save
  ]

  def index
  end

  def show
  end

  def new
    # todo: 本来user_idは自動設定されるはずだが、されないので修正したい
    @articles = Article.create(user_id: current_user.id)
    redirect_to edit_article_path(@articles)
  end

  def create
  end

  def edit
    @items = @articles.items.order("id desc")
    if @items.present?
      item_order = @articles.item_order.split(",") if @articles.item_order
      @items = @articles.items.where(id: item_order).order(['field(id, ?)', item_order])
    end
  end

  def update
    @articles.update(article_params)
    redirect_to edit_article_path(@articles)
  end

  def destroy
  end

  def add_text
    @article_id = params[:id]
    @items = Item.new(item_type: "text")
  end

  def add_header
    @article_id = params[:id]
    @items = Item.new(item_type: "header")
  end

  def add_quote
    @article_id = params[:id]
    @items = Item.new(item_type: "quote")
  end

  def add_button
    @article_id = params[:id]
    @items = Item.new(item_type: "button")
  end

  def add_image
    @article_id = params[:id]
    @items = Item.new(item_type: "image")
  end

  def save
    @articles.update(item_order: params[:item_order])
    redirect_to edit_article_path(@articles.id)
  end

  private

  def set_articles
    @articles = Article.find(params[:id])
  end

  def article_params
    params[:article].permit(
      :title,
      :desc,
      :item_order,
      :image,
      :remote_image_url
    )
  end
end