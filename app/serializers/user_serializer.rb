class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :is_admin
end
