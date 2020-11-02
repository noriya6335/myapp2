class CategoryController < ApplicationController
  before_action :set_category,  only: [:show]
  def index
    @categories = Category.all
    @items = Item.all
  end

  def show
    @item = Item.where(category_id: @category.id)
  end

  private
 
  def set_category
    @category = Category.find(params[:id])
  end
end
