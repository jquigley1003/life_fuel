class RenameColumnFavoritesEventsIdToEventId < ActiveRecord::Migration
  def change
    rename_column :favorites, :events_id, :event_id
  end
end
