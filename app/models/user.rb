class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness:true
  validates :password, length:{in:8..16}
end
