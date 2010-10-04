class Photo < ActiveRecord::Base
  belongs_to :album

  has_attached_file :image #, :styles => {}

  validates_presence_of :title
  validates_attachment_presence :image
end
