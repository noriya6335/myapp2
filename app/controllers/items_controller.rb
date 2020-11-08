class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @newitems = Item.includes(:item_images).order("created_at DESC").limit(10)
    @newcommentitems = Item.includes(:comments).order("comments.created_at DESC").limit(10)
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def show
    @category = @item.category
    @comment = Comment.new
    @comments = @item.comments.includes(:user)

    if @item.comments.blank?
      @average_review = 0
    else
      @average_review = @item.comments.average(:rate).round(2)
    end
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


  def destroy
    @item.destroy
    flash[:notice] = '削除しました'
    redirect_to root_path
  end

  
  private
  def item_params
    params.require(:item).permit(:name, :description, :maker ,:price, :category_id,  item_images_attributes: [:image])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
