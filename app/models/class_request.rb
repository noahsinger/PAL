class ClassRequest < ActiveRecord::Base
  belongs_to :certification
  
  validates_presence_of :from
  validates_presence_of :time
  
  validates_format_of :from, :with => /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(([0-9]{1,3})|([a-zA-Z]{2,3})|(aero|coop|info|museum|name))$/
end
