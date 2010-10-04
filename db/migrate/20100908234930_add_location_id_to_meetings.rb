class AddLocationIdToMeetings < ActiveRecord::Migration
  def self.up
    add_column :meetings, :location_id, :integer
  end

  def self.down
    remove_column :meetings, :location_id
  end
end
