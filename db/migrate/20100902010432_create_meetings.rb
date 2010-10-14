class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.datetime :time
      t.text :description
      t.references :section

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
