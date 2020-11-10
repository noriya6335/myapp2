class TagsController < ApplicationController

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    @items = Item.tagged_with(@tag.name)
  end

end
