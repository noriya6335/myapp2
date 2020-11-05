class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_images
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :category

  accepts_nested_attributes_for :item_images, allow_destroy: true

end
