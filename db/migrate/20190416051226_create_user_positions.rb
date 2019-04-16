class CreateUserPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_positions do |t|
      t.references :user
      t.references :position
      t.timestamps
    end
  end
end
