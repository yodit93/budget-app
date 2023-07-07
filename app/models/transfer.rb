class Transfer < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  has_many :category_transfers, dependent: :destroy
  has_many :categories, through: :category_transfers
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0.1 }
end
