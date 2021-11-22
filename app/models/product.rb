class Product < ApplicationRecord
    validates :name, :price, presence: true

    has_many :relations
    has_many :categories, through: :relations

    has_many :favorites
    has_many :users, through: :favorites
end
