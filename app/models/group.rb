class Group < ActiveRecord::Base
  has_many :groups_performers
  has_and_belongs_to_many :performers
  accepts_nested_attributes_for :groups_performers, allow_destroy: true
end
