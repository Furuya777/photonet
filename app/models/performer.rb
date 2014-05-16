class Performer < ActiveRecord::Base
  has_many :groups_performers

  attr_accessor :full_name

  def full_name
    self.full_name = "#{self.last_name} #{self.first_name}"
  end

  def full_name_kana
    self.full_name_kana = "#{self.last_name_kana} #{self.first_name_kana}"
  end
end
