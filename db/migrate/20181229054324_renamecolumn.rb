class Renamecolumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :reader_id, :article_id
  end
end
