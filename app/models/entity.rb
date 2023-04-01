class Entity < ApplicationRecord
  belongs_to :user
  has_many :entity_groups, dependent: :destroy
  has_many :groups, through: :group_operations

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
