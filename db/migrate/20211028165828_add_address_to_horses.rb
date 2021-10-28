class AddAddressToHorses < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :address, :string
  end
end
