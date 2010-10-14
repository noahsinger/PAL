class Location < ActiveRecord::Base
  has_many :meetings

  validates_presence_of :name, :lat, :lng
  validates_numericality_of :lat, :lng
  validates_uniqueness_of :name
end
