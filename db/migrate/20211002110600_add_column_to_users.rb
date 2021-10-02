class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :postal, :string
    add_column :users, :firstkana, :string
    add_column :users, :lastkana, :string
  end
end
