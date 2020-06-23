class Student

  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id=nil)
    @id = nil
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
      )
      SQL
      DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
    DELETE FROM students;
    SQL
    DB[:conn].execute(table_check_sql)[0]).
  end

  def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?)
      SQL

      DB[:conn].execute(sql, self.name, self.grade)

      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end

  def self.create(student)
    student = Student.new(name, grade)
    student.save
    student
  end


end
