class Photo < ActiveRecord::Base
  has_many :photos_tags
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :photos_tags, allow_destroy: true

  mount_uploader :image, ImageUploader
end
