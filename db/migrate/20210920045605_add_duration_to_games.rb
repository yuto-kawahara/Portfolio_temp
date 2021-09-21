class AddDurationToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :duration, :string
  end
end
