Rails.application.routes.draw do
  devise_for :users, skip: :all
  namespace 'api' do
    namespace 'v1' do

      scope 'user' do
        get 'index', to: 'user#index'
        get 'show/:id', to: 'user#show'
        post 'create', to: 'user#create'
        patch 'update/:id', to: 'user#update'
        delete 'delete/:id', to: 'user#delete'
        get 'my_favorites/:id', to:"user#my_favorites"
      end

      scope 'products' do
        get 'index', to: 'products#index'
        get 'show/:id', to: 'products#show'
        post 'create', to: 'products#create'
        patch 'update/:id', to:'products#update'
        delete 'delete/:id', to:'products#delete'
        get 'my_categories/:id', to:"products#my_categories"
      end

      scope 'categories' do
        get 'index', to: 'categories#index'
        get 'show/:id', to: 'categories#show'
        post 'create', to: 'categories#create'
        patch 'update/:id', to:'categories#update'
        delete 'delete/:id', to:'categories#delete'
        get 'my_products/:id', to:"categories#my_products"
      end

      scope 'relations' do
        get 'index', to: 'relations#index'
        post 'create', to: 'relations#create'
        patch 'update/:id', to:'relations#update'
        delete 'delete/:id', to:'relations#delete'
      end

      scope 'favorites' do
        get 'index', to: 'favorites#index'
        post 'create', to: 'favorites#create'
        patch 'update/:id', to:'favorites#update'
        delete 'delete/:id', to:'favorites#delete'
      end
    end
  end
end
