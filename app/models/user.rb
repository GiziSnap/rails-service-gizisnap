class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :username, uniqueness: true, presence: true
  validates :email_address, uniqueness: true, presence: true
  validates :password, presence: true
end
