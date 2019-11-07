require_relative('../db/sqlrunner')

class Student

  attr_accessor :first_name, :second_name, :house, :age
  attr_reader :id

  def initialize(options)
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house'].to_i()
    @age = options['age'].to_i()
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO students
          (first_name, second_name, house, age)
          VALUES
          ($1, $2, $3, $4)
          RETURNING id"
    values = [@first_name, @second_name, @house, @age]
    result = SqlRunner.run(sql, values).first()
    @id = result[:id]
  end

  def house()
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@house]
    house = SqlRunner.run(sql, values).first()
    return House.new(house)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Student.new(result)
  end

  def self.all()
    sql = "SELECT * FROM students"
    result = SqlRunner.run(sql)
    return Student.map_items(result)
  end

  def self.map_items(data)
    return data.map{|student| Student.new(student)}
  end
end
