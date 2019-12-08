require_relative '../config/environment.rb'

class Dog
  attr_accessor :id, :name, :breed
  def initialize(hash)
    self.id = nil
    hash.each {|key, value| self.send(("#{key}="), value)}
  end
  
  def create_table
    sql = <<-SQL
    "CREATE TABLE IF NOT EXISTS dogs(
    id 
    )
    SQL
  end
  
  
  
  
end