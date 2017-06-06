class RenameGigDatesColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :gigs, :start, :start_date
    rename_column :gigs, :end, :end_date
  end
end
