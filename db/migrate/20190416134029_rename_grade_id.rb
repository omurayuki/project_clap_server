class RenameGradeId < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :sports_type, :sports_id
  end
end
