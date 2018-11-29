class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :authorname
      t.string :story
      t.string :category

      t.timestamps
    end
  end
end
