class AddNationalityIdToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :nationality_id, :integer
  end
end
