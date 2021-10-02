class RemoveColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :postal1, :string
    remove_column :users, :postal2, :string
  end
end
