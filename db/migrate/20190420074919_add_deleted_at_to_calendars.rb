class AddDeletedAtToCalendars < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :deleted_at, :date
  end
end
