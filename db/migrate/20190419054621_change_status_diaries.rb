class ChangeStatusDiaries < ActiveRecord::Migration[5.2]
  def change
    change_column :diaries, :text_1, :string
    change_column :diaries, :text_2, :string
    change_column :diaries, :text_3, :string
    change_column :diaries, :text_4, :string
    change_column :diaries, :text_5, :string
    change_column :diaries, :text_6, :string
  end
end
