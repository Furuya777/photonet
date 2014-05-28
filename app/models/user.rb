class User < ActiveRecord::Base
  validates :cookie_code, presence: true, uniqueness: true
end
