class Photo < ActiveRecord::Base
  belongs_to :event
  
  has_many :photos_tags
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :photos_tags, allow_destroy: true

  has_many :groups_photos
  has_and_belongs_to_many :groups
  accepts_nested_attributes_for :groups_photos, allow_destroy: true

  has_many :performers_photos
  has_and_belongs_to_many :performers
  accepts_nested_attributes_for :performers_photos, allow_destroy: true

  mount_uploader :image, ImageUploader

  scope :order_created_at, -> { order(created_at: :desc)}
  scope :tag, ->(tag_id) do
    includes(:photos_tags)
      .where("photos_tags.tag_id = ?", tag_id)
  end

  validates :title,     presence: true, length: { maximum: 20 }
  validates :image,     presence: true
  validates :content,                   length: { maximum: 200 }
end
