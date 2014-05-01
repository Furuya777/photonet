class Tag < ActiveRecord::Base
  has_many :photos_tags, dependent: :destroy
end
