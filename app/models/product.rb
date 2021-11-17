class Product < ApplicationRecord
    validates :name, :price, presence: true

    has_many :relations
    has_many :categories, through: :relations
end
