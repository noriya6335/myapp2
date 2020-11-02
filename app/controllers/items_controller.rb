class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @newitems = Item.includes(:item_images).order("created_at DESC").limit(2)
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def show
    @category = @item.category
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品を登録しました'
    else
      @item.item_images.new
      @item.valid?
      render :new
    end
  end

  def review
    @items = Item.includes(:item_images).order("created_at DESC")
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :description, :maker ,:price, :category_id,  item_images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
