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
  
  def self.create(hash)
    dog = Dog.new(hash)
    dog.save
    dog
  end
  
  def self.new_from_db(row)
    id = row[0]
    name = row[1]
    breed = row[2]
    self.new(id: id, name: name, breed: breed)
  end
  
  def self.find_by_id(id)
    dog = DB[:conn].execute("SELECT * FROM dogs WHERE id = ?", id)
    new_dog = Dog.new(id: dog[0][0],name: dog[0][1],breed: dog[0][2])
  end
  
  def self.find_or_create_by(hash)
    sql = <<-SQL
    SELECT * FROM dogs WHERE 
    SQL
    else self.create(hash)
    end
  end
  
  
  
  
end