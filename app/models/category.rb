class Category < ApplicationRecord
  belongs_to :author, foreign_key: :author_id, class_name: 'User'
  has_many :category_transfers, dependent: :destroy
  has_many :transfers, through: :category_transfers
  validates :name, presence: true
  validates :icon, presence: true
end
