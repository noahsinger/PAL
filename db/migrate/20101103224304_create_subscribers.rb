class CreateSubscribers < ActiveRecord::Migration
  def self.up
    create_table :subscribers do |t|
      t.string :email
      t.boolean :verified

      t.timestamps
    end
  end

  def self.down
    drop_table :subscribers
  end
end