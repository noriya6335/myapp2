class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :item_images
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :category
  acts_as_taggable
  accepts_nested_attributes_for :item_images, allow_destroy: true
  validates :name, :description, :maker, :price, :category_id ,:item_images ,presence: true
  validates_associated :item_images
end
