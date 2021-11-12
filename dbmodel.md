Table Product {
  id int [pk, increment]
  name string [not null]
  photo varbinary [not null]
}

Table Entry {
  id int [pk, increment]
  products ref [not null, ref: < Product.id]
}

Table Main {
  id int [pk, increment]
  products ref [not null, ref: < Product.id]
}

Table Dessert {
  id int [pk, increment]
  products ref [not null, ref: < Product.id]
}

Table Drinks {
  id int [pk, increment]
  products ref [not null, ref: < Product.id]
}

Table User {
  id int [pk, increment]
  username string [not null]
  avatar varbinary [not null]
  email string [not null]
  password string [not null]
  favorites ref [ref: < Product.id]
}
