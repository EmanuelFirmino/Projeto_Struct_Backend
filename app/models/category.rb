class Category < ApplicationRecord
    validates :name, presence: true
    validates :name , uniqueness: true

    has_many :relations, dependent: :destroy
    has_many :products, through: :relations
end
