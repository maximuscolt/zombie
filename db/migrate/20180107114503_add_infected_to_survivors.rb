class AddInfectedToSurvivors < ActiveRecord::Migration[5.1]
  def change
    add_column :survivors, :infected, :boolean
  end
end
