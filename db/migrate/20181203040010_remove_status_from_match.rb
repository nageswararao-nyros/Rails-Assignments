class RemoveStatusFromMatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :status, :string
  end
end
