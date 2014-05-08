class Tag < ActiveRecord::Base
  has_many :photos_tags, dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
end
