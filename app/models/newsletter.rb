class Newsletter < ActiveRecord::Base
  has_many :newsletter_sections, :order => :position
end
