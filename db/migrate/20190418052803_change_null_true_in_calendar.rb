class ChangeNullTrueInCalendar < ActiveRecord::Migration[5.2]
  def change
    change_column :teams, :calendar_id, :integer, null: true 
  end
end
