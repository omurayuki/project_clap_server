class CreateDiaryTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :diary_titles do |t|
      t.string :title_1
      t.string :title_2
      t.string :title_3
      t.string :title_4
      t.string :title_5
      t.string :title_6

      t.timestamps
    end
  end
end
