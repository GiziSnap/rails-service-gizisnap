class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :foods, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :username, uniqueness: true, presence: true, length: { minimum: 6 }
  validates :email_address, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
