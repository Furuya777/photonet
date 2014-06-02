class Recommend < ActiveRecord::Base
  belongs_to :photo

  validates :photo_id,  numericality: true, allow_blank: true
  validate :valid_photo_id

  private

  def valid_photo_id
    errors.add(:photo_id, :invalid) if Photo.where(id: self.photo_id).none?
  end
end
