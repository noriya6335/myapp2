class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    @newitems = Item.includes(:item_images).order("created_at DESC").limit(5)
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def show
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.item_images.new
      @item.valid?
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :maker ,:price, :category_id,  item_images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
