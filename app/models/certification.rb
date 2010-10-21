class Certification < ActiveRecord::Base
  has_many :class_requests
  has_many :sections
  belongs_to :certification_level

  # scope include(:sections).order(:start_date).first  

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :description
  validates_presence_of :certification_level_id
end
