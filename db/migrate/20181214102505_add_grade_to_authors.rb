class AddGradeToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :grade, :string
  end
end
