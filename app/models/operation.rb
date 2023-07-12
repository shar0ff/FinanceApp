class Operation < ApplicationRecord
  belongs_to :category

  paginates_per 10

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, presence: true
end
