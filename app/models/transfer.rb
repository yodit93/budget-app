class Transfer < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.1 }
end
