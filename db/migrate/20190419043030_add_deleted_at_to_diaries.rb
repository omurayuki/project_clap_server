class AddDeletedAtToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :deleted_at, :datetime
  end
end
