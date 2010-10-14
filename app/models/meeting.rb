class Meeting < ActiveRecord::Base
  belongs_to :section
  belongs_to :location

  validates_presence_of :time
  validates_presence_of :section_id
end
