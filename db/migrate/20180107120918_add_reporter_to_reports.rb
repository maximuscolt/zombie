class AddReporterToReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :reporter, :integer
  end
end
