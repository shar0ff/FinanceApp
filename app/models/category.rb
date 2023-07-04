class Category < ApplicationRecord
  has_many :operations

  validates :name, presence: true, allow_blank: false, uniqueness: true
  validates :description, presence: true
end

