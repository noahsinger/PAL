class Section < ActiveRecord::Base
  belongs_to :certification
  has_many :meetings
end
