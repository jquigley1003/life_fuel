class RenameColumnEventsCategoryToVenueId < ActiveRecord::Migration
  def change
    rename_column :events, :category, :venue_id
  end
end
