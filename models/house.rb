require_relative('../db/sqlrunner')

class House

  attr_accessor :name, :logo_url
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @logo_url = options['logo_url']
    @id = options['id'].to_i() if options['id']
  end

  def save()
    sql = "INSERT INTO houses
          (name, logo_url)
          VALUES
          ($1, $2)
          RETURNING id"
    values = [@name, @logo_url]
    result = SqlRunner.run(sql, values).first()
    @id = result[:id]
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return House.new(result)
  end

  def self.all()
    sql = "SELECT * FROM houses"
    result = SqlRunner.run(sql)
    return House.map_items(result)
  end

  def self.map_items(data)
    return data.map{|house| House.new(house)}
  end
end
