class ApplicationController < ActionController::Base
  include Jpmobile::ViewSelector
  protect_from_forgery with: :exception
  before_filter :set_view_path
  before_filter :get_category

  def get_category
    @category = Category.all
  end

  private

  def set_view_path
    path =  request.smart_phone? ? 'sp' : 'pc'
    prepend_view_path(Rails.root + 'app/views' + path)
  end
end