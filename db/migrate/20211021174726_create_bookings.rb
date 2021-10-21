class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :horse, null: false, foreign_key: true
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
