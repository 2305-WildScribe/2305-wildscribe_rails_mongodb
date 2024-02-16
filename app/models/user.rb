class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  has_many :adventures
  # has_secure_password
  # validates :email, uniqueness: true, presence: true
  # validates :name, presence: true
  # validates_confirmation_of :password, presence: true

  has_secure_password
end
