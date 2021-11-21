class AddFieldsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :authentication_token, :string, limit: 30
  end
end
