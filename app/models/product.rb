class Product < ApplicationRecord
    validates :name, :price, :description, presence: true

    has_many :relations
    has_many :categories, through: :relations

    has_many :favorites
    has_many :users, through: :favorites

    has_one_attached :image
end
