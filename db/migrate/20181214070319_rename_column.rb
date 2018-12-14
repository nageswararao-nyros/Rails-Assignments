class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :authors, :nationality, :nationality_id
  end
end
