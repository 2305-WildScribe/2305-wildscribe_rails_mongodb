class User
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :password, type: String
  # has_many :adventures
  # has_secure_password
  # validates :email, uniqueness: true, presence: true
  # validates :name, presence: true
  # validates_confirmation_of :password, presence: true

  # has_secure_password
end
