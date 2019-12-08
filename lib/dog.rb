require_relative '../config/environment.rb'

class Dog
  
  def initialize(hash)
    hash.each {|key, value| self.send(("#{key}="), value)}
    self.id ||= nil
  end
  
  
  
  
  
  
end