class AddAvatarToHorses < ActiveRecord::Migration[6.0]
  def change
    add_column :horses, :avatar, :string
  end
end
