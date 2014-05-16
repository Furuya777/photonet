class PerformersPhoto < ActiveRecord::Base
  belongs_to :performers
  belongs_to :photos
end
