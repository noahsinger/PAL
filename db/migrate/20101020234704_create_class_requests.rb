class CreateClassRequests < ActiveRecord::Migration
  def self.up
    create_table :class_requests do |t|
      t.references :certification
      t.string :from
      t.string :time
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :class_requests
  end
end
