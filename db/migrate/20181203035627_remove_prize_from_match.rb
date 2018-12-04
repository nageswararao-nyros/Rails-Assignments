class RemovePrizeFromMatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :matches, :prize, :string
  end
end
