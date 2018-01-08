class CreateSurvivors < ActiveRecord::Migration[5.1]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
