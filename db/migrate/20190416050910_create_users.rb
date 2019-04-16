class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.references :team

      t.timestamps
    end
  end
end
