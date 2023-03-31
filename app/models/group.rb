class Group < ApplicationRecord
  belongs_to :user
  has_many :entity_groups, dependent: :destroy
  has_many :entity, through: :group_payments

  validates :name, :icon, presence: true

  def total_amount
    payments.sum(:amount)
  end
end
