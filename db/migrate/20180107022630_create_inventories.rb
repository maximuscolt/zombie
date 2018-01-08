class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.references :resource, foreign_key: true
      t.references :survivor, foreign_key: true

      t.timestamps
    end
  end
end
