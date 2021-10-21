class CreateHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :horses do |t|
      t.string :horse_name
      t.integer :speed
      t.integer :height
      t.string :obedience
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
