require_relative '../config/environment.rb'

class Dog
  attr_accessor :id, :name, :breed
  def initialize(hash)
    self.id = nil
    hash.each {|key, value| self.send(("#{key}="), value)}
    #self.id ||= nil
  end
  
  
  
  
  
  
end