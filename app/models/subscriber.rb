require 'digest/sha2'

class Subscriber < ActiveRecord::Base
  validates_presence_of :email
  validates_format_of :email, :with => /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))$/
  validates_uniqueness_of :email
  
  after_create :set_code
  
  def set_code
    self.code = Digest::SHA256.hexdigest("subscriber#{self.id}#{self.email}")
    self.save
  end
end
