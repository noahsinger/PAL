class NewsletterSection < ActiveRecord::Base
  belongs_to :newsletter
  
  validates_presence_of :title
  validates_presence_of :content
  validates_attachment_content_type :image, :if => lambda{!image_file_name.blank?}, :content_type => ['image/jpeg','image/gif','image/png']
  
  has_attached_file :image, :styles => {:default => "300x200>"}
end
