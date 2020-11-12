class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  validates :text,:title,  presence: true
end
