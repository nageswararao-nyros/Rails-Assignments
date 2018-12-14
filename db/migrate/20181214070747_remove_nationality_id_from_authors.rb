class RemoveNationalityIdFromAuthors < ActiveRecord::Migration[5.2]
  def change
    remove_column :authors, :nationality_id, :string
  end
end
