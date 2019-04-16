class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :title, null: false
      t.text :detail
      t.references :calendar
      t.timestamps
    end
  end
end