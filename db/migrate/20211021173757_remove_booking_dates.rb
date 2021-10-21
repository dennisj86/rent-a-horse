class RemoveBookingDates < ActiveRecord::Migration[6.0]
  def change
    remove_column :horses, :from_date
    remove_column :horses, :to_date
  end
end
