require('PG')

class SqlRunner
  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'hogwarts', host: 'localhost'})
      db.prepare('run', sql)
      result = db.exec_prepared('run', values)
    ensure
      db&.close # the & can be used to check if nil
    end
    return result
  end
end
