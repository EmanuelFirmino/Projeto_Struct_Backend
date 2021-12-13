# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# salgados
Product.create(name:"coxinha", price: 4.50, description: "coxinha tradicional")
Product.last.image.attach(io: File.open('./public/coxinha.jpeg'), filename: 'coxinha.jpeg')
Product.create(name:"pastel", price: 6.0, description: "frito na hora")
Product.last.image.attach(io: File.open('./public/pastel.jpg'), filename: 'pastel.jpg')
Product.create(name:"misto", price: 3.50, description: "misto tradional")
Product.last.image.attach(io: File.open('./public/misto.jpeg'), filename: 'misto.jpeg')
Product.create(name:"espetinho", price: 4.50, description: "assado na hora")
Product.last.image.attach(io: File.open('./public/espetinho.jpg'), filename: 'espetinho.jpg')
Product.create(name:"pão na chapa", price: 3.50, description: "super crocante")
Product.last.image.attach(io: File.open('./public/pao_na_chapa.jpg'), filename: 'pao_na_chapa.jpg')






# doces
Product.create(name:"sonho", price: 4.0, description: "feito na casa")
Product.last.image.attach(io: File.open('./public/sonho.jpeg'), filename: 'sonho.jpeg')
Product.create(name:"donut", price: 3.0, description: "feito na casa")
Product.last.image.attach(io: File.open('./public/donut.jpeg'), filename: 'donut.jpeg')
Product.create(name:"salada de frutas", price: 3.50, description: "fresquinha")
Product.last.image.attach(io: File.open('./public/salada_de_frutas.jpg'), filename: 'salada_de_frutas.jpg')
Product.create(name:"bomba de chocolate", price: 3.50, description: "super recheada")
Product.last.image.attach(io: File.open('./public/bomba.jpg'), filename: 'bomba.jpg')
Product.create(name:"pudim", price: 3.50, description: "super macio")
Product.last.image.attach(io: File.open('./public/pudim.jpg'), filename: 'pudim.jpg')




# bebidas
Product.create(name:"suco", price: 5.0, description: "de polpa natural")
Product.last.image.attach(io: File.open('./public/suco.jpeg'), filename: 'suco.jpeg')
Product.create(name:"agua", price: 2.50, description: "natural ou com gás")
Product.last.image.attach(io: File.open('./public/agua.jpeg'), filename: 'agua.jpeg')
Product.create(name:"cafe", price: 3.50, description: "grãos selecionados")
Product.last.image.attach(io: File.open('./public/cafe.jpeg'), filename: 'cafe.jpeg')
Product.create(name:"cerveja", price: 3.50, description: "estupidamente gelada")
Product.last.image.attach(io: File.open('./public/cerveja.jpg'), filename: 'cerveja.jpg')
Product.create(name:"refrigerante", price: 3.50, description: "beba com moderação")
Product.last.image.attach(io: File.open('./public/refri.jpg'), filename: 'refri.jpg')






# categorias
Category.create(name:"salgado")
Category.create(name:"doce")
Category.create(name:"bebida")
Category.create(name:"todos")


# relações
Relation.create(product_id: 1, category_id: 1)
Relation.create(product_id: 2, category_id: 1)
Relation.create(product_id: 3, category_id: 1)
Relation.create(product_id: 4, category_id: 1)
Relation.create(product_id: 5, category_id: 1)

Relation.create(product_id: 6, category_id: 2)
Relation.create(product_id: 7, category_id: 2)
Relation.create(product_id: 8, category_id: 2)
Relation.create(product_id: 9, category_id: 2)
Relation.create(product_id: 10, category_id: 2)


Relation.create(product_id: 11, category_id: 3)
Relation.create(product_id: 12, category_id: 3)
Relation.create(product_id: 13, category_id: 3)
Relation.create(product_id: 14, category_id: 3)
Relation.create(product_id: 15, category_id: 3)


Relation.create(product_id: 15, category_id: 4)
Relation.create(product_id: 14, category_id: 4)
Relation.create(product_id: 13, category_id: 4)
Relation.create(product_id: 12, category_id: 4)
Relation.create(product_id: 11, category_id: 4)
Relation.create(product_id: 10, category_id: 4)
Relation.create(product_id: 9, category_id: 4)
Relation.create(product_id: 8, category_id: 4)
Relation.create(product_id: 7, category_id: 4)
Relation.create(product_id: 6, category_id: 4)
Relation.create(product_id: 5, category_id: 4)
Relation.create(product_id: 4, category_id: 4)
Relation.create(product_id: 3, category_id: 4)
Relation.create(product_id: 2, category_id: 4)
Relation.create(product_id: 1, category_id: 4)






# users
User.create(email:"user_1@mail.com", password:"123456", name:"user_1", is_admin: false)
User.create(email:"user_2@mail.com", password:"123456", name:"user_2", is_admin: false)
User.create(email:"user_3@mail.com", password:"123456", name:"user_3", is_admin: false)
User.create(email:"admin@mail.com", password:"123456", name:"admin", is_admin: true)


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




