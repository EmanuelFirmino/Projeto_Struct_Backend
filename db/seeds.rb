# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# salgados
Product.create(name:"coxinha", price: 4.50)
Product.create(name:"pastel", price: 6.0)
Product.create(name:"misto", price: 3.50)

# doces
Product.create(name:"sonho", price: 4.0)
Product.create(name:"donut", price: 3.0)
Product.create(name:"salada de frutas", price: 3.50)

# bebidas
Product.create(name:"suco", price: 5.0)
Product.create(name:"agua", price: 2.50)
Product.create(name:"cafe", price: 3.50)

# categorias
Category.create(name:"salgado")
Category.create(name:"doce")
Category.create(name:"bebida")

# relações
Relation.create(product_id: 1, category_id: 1)
Relation.create(product_id: 2, category_id: 1)
Relation.create(product_id: 3, category_id: 1)

Relation.create(product_id: 4, category_id: 2)
Relation.create(product_id: 5, category_id: 2)
Relation.create(product_id: 6, category_id: 2)

Relation.create(product_id: 7, category_id: 3)
Relation.create(product_id: 8, category_id: 3)
Relation.create(product_id: 9, category_id: 3)

# users
User.create(email:"user_1@mail.com", password:"123456", name:"user_1", is_admin: false)
User.create(email:"user_2@mail.com", password:"123456", name:"user_2", is_admin: false)
User.create(email:"user_3@mail.com", password:"123456", name:"user_3", is_admin: false)

# favorites
Favorite.create(product_id: 1, user_id: 1)
Favorite.create(product_id: 2, user_id: 1)
Favorite.create(product_id: 3, user_id: 1)

Favorite.create(product_id: 4, user_id: 2)
Favorite.create(product_id: 5, user_id: 2)
Favorite.create(product_id: 6, user_id: 2)

Favorite.create(product_id: 7, user_id: 3)
Favorite.create(product_id: 8, user_id: 3)
Favorite.create(product_id: 9, user_id: 3)

