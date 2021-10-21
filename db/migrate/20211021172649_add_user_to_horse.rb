class AddUserToHorse < ActiveRecord::Migration[6.0]
  def change
    add_reference :horses, :user, index: true
  end
end
