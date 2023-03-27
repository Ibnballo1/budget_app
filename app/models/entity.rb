class Entity < ApplicationRecord
  belongs_to :user

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
