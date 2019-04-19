class ChangeStatusToStringDiaries < ActiveRecord::Migration[5.2]
  def change
    change_column :diaries, :text_1, :text
    change_column :diaries, :text_2, :text
    change_column :diaries, :text_3, :text
    change_column :diaries, :text_4, :text
    change_column :diaries, :text_5, :text
    change_column :diaries, :text_6, :text
  end
end
