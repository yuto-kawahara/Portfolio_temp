class AddGameIdToRecruits < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :game_id, :integer
  end
end
