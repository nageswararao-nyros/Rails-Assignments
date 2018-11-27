class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :authorname
      t.string :title
      t.string :story

      t.timestamps
    end
  end
end
