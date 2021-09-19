class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|
      t.string :title
      t.date :date
      t.time :time
      t.string :place
      t.integer :headcount
      t.text :remarks
      t.timestamps
    end
  end
end
