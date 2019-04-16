class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :team_id, null: false
      t.string :name, null: false
      t.integer :sports_type, null: false
      t.integer :grade_id, null: false
      t.integer :calendar_id, null: false

      t.timestamps
    end
  end
end