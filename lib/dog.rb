require_relative '../config/environment.rb'

class Dog
  attr_accessor :id, :name, :breed
  def initialize(hash)
    self.id = nil
    hash.each {|key, value| self.send(("#{key}="), value)}
  end
  
  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS dogs(
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT
    )
    SQL
    
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
    DROP TABLE IF EXISTS dogs
    SQL
    DB[:conn].execute(sql)
  end
  
  def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed) 
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    self
  end
  
  def self.create(name:, breed:)
    dog = Dog.new(name, breed)
    dog.save
    dog
  end
  
  
  
  
  
  
  
  
  
  
end