class GroupsPerformer < ActiveRecord::Base
  belongs_to :groups
  belongs_to :performers
end
