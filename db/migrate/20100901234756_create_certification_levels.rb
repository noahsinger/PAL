class CreateCertificationLevels < ActiveRecord::Migration
  def self.up
    create_table :certification_levels do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :certification_levels
  end
end
