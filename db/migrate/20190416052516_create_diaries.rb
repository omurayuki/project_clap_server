class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.text :text_1, null: false
      t.text :text_2, null: false
      t.text :text_3, null: false
      t.text :text_4, null: false
      t.text :text_5, null: false
      t.text :text_6, null: false
      t.references :user

      t.timestamps
    end
  end
end
