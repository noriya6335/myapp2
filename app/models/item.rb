class Item < ApplicationRecord
  has_many :item_images
  has_many :comments
  mount_uploader :image, ImageUploader
end
