class Group < ApplicationRecord
  belongs_to :user
  validates :name, :icon, presence: true
end
