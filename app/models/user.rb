class User < ApplicationRecord
  has_many :entities
  has_many :groups

  validates :name, presence: true
end
