Table Products as P{
  id int [pk, not null]
  name string [unique, not null]
  price float4 [not null]
  photo varbinary [not null]
}

Table Categories as C{
  id int [pk, not null]
  name string [unique, not null]
}

Table Relations as R{
  id int [pk, not null]
  product_id int [not null, ref: > P.id]
  categorie_id int [not null, ref: > C.id]
}

Table User as U{
  id int [pk, not null]
  name string [not null]
  email string [unique, not null]
  password string [not null]
  profile_pic varbinary [not null]
  is_admin boolean [not null]
}

Table Favorites as F{
  id int [pk, not null]
  user_id int [not null, ref: > U.id]
  product_id int [not null, ref: > P.id]
}

