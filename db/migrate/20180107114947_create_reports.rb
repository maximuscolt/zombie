class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.references :survivor, foreign_key: true

      t.timestamps
    end
  end
end
