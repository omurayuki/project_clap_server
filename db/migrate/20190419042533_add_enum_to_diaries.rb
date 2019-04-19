class AddEnumToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :status, :integer
  end
end