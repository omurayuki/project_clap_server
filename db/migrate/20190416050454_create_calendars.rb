class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
