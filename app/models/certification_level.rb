class CertificationLevel < ActiveRecord::Base
  has_many :certifications

  validates_uniqueness_of :name
  validates_presence_of :name
end
