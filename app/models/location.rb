class Location < ActiveRecord::Base
  has_many :meetings

  validates_presence_of :name
end
