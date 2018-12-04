class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
  	change_column :articles, :id, :integer, auto_increment: true
  end
end
