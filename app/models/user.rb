class User < ApplicationRecord
  has_many :adventures
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates_confirmation_of :password, presence: true
end
