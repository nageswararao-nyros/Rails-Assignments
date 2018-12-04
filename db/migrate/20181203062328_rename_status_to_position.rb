class RenameStatusToPosition < ActiveRecord::Migration[5.2]
  def change
  	rename_column :games, :status, :position
  end
end
