class AddCodeToSubscribers < ActiveRecord::Migration
  def self.up
    add_column :subscribers, :code, :string
  end

  def self.down
    remove_column :subscribers, :code
  end
end
