class CreateResources < ActiveRecord::Migration[5.1]
  def change
    create_table :resources do |t|
      t.string :item
      t.integer :point

      t.timestamps
    end
  end
end
