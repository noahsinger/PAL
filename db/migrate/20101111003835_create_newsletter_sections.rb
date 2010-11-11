class CreateNewsletterSections < ActiveRecord::Migration
  def self.up
    create_table :newsletter_sections do |t|
      t.string :title
      t.text :content
      t.string :image
      t.integer :position
      t.references :newsletter

      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_sections
  end
end
