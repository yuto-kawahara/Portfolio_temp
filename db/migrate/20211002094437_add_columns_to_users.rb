class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :lastname, :string
    add_column :users, :firstname, :string
    add_column :users, :postal1, :string
    add_column :users, :postal2, :string
    add_column :users, :address, :string
    add_column :users, :tel, :string
  end
end
