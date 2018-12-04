class RemoveAuthornameFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :authorname, :string
  end
end
