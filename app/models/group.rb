class Group < ApplicationRecord
  belongs_to :user
  has_many :group_payments, dependent: :destroy
  has_many :payments, through: :group_payments

  validates :name, :icon, presence: true

  def total_amount
    payments.sum(:amount)
  end
end
