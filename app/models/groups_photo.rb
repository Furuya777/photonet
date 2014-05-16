class GroupsPhoto < ActiveRecord::Base
  belongs_to :groups
  belongs_to :photos
end
