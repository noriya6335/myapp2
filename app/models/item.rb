class Item < ApplicationRecord
  has_many :item_images
  has_many :comments

  accepts_nested_attributes_for :item_images, allow_destroy: true
end
