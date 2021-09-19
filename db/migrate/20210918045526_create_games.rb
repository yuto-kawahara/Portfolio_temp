class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :name
      t.text :body
      t.integer :headcount
      t.string :level
      t.string :game_image_id
      t.timestamps
    end
  end
end
