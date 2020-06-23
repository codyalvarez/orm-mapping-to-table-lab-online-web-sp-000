class Student

  attr_accessor :name, :grade, :id

  def initialize(name, grade, id=nil)
    @id = nil
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-sql
      CREATE TABLE IF NOT EXISTS songs (
      id INTEGER PRIMARY KEY,
      name TEXT,
      album TEXT
      )
      SQLite3
  end


end
