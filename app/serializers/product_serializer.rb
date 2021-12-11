class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :image_url

  has_many :categories
  
  def image_url
    if object.image.attached?
      Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
    else
      "produto sem imagem"
    end
  end

end
