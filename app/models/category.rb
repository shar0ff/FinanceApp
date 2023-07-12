class Category < ApplicationRecord
  has_many :operations, dependent: :destroy

  paginates_per 10

  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :description, presence: true
end

