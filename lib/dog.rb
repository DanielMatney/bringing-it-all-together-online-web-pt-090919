class Dog
  
  def initialize(hash)
    hash.each {|key, value| self.send(("#{key}="), value)}
  end
  
  
  
  
  
  
end