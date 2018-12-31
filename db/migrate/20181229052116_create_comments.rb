class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :reader_id
      t.string :name
      t.string :comment

      t.timestamps
    end
  end
end
