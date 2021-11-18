class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password, :is_admin
end
