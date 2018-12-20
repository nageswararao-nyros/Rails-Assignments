class AddPaperclipToArticle < ActiveRecord::Migration[5.2]
  def change
    add_attachment :articles, :poster
  end
end
