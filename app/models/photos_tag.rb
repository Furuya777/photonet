class PhotosTag < ActiveRecord::Base
  belongs_to :photos
  belongs_to :tags
end
