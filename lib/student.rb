class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]

  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table

    sql = <<-SQL

      CREATE TABLE students (
          id INTEGER PRIMARY KEY,
          name TEXT,
          grade INTEGER
      );
    SQL

    DB[:conn].execute(sql)

  end

  def self.drop_table

    sql = "DROP TABLE students";
    DB[:conn].execute(sql)

  end

  def save

    sql = <<-SQL
        INSERT INTO students (name, grade)
        VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, name, grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]

  end

  def self.create (name:, grade:)
      new_student = Student.new(name, grade)
      new_student.save
      new_student
  end

  #updated code
end #end class
























  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  #
  # attr_accessor :name, :grade
  # attr_reader :id
  #
  # def initialize(name, grade, id=nil)
  #   @name = name
  #   @grade = grade
  #   @id = id
  # end
  #
  # def self.create_table
  #
  #     sql = <<-SQL
  #       CREATE TABLE students (
  #         id INTEGER PRIMARY KEY,
  #         name TEXT,
  #         grade INTEGER
  #       )
  #     SQL
  #     DB[:conn].execute(sql)
  # end
  #
  # def self.drop_table
  #
  #     sql = <<-SQL
  #       DROP TABLE students
  #     SQL
  #     DB[:conn].execute(sql)
  # end
  #
  # def save
  #
  #   sql = <<-SQL
  #     INSERT INTO students (name, grade) VALUES (?, ?)
  #   SQL
  #
  #   DB[:conn].execute(sql, self.name, self.grade)
  #   @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  # end
  #
  #
  # def self.create (name:, grade:)
  #     new_student = self.new(name, grade) #why are these not instance variables?
  #     new_student.save
  #     new_student
  # end
  #
