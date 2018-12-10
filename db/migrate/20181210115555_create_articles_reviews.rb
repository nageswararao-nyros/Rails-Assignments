class CreateArticlesReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_reviews do |t|
      t.integer :article_id
      t.integer :review_id

      t.timestamps
    end
  end
end
