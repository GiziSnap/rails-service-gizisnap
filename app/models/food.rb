class Food < ApplicationRecord
  belongs_to :user

  validates :name, :quantity, :calories, :protein, :carbs, :fat, presence: true
end
