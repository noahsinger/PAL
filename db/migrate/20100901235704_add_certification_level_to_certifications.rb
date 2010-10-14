class AddCertificationLevelToCertifications < ActiveRecord::Migration
  def self.up
    add_column :certifications, :certification_level_id, :integer
  end

  def self.down
    remove_column :certifications, :certification_level_id
  end
end
