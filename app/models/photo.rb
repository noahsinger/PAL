class Photo < ActiveRecord::Base
  belongs_to :album

  has_attached_file :image , :styles => {:display => "800x600>", :thumb => "100x100>", :tiny => "30x30>"}

  validates_presence_of :title
  validates_attachment_presence :image
end
