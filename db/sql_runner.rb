require "pg"

class SqlRunner
  def SqlRunner.run(sql, values = [])
    begin
      # db = PG.connect({ dbname: "cash_money_board", host: "localhost" })
      db = PG.connect(ENV['DATABASE_URL'])
      if values.empty?
        pg_result = db.exec(sql)
      else
        db.prepare("query", sql)
        pg_result = db.exec_prepared("query", values)
      end
    ensure
      db.close if db
    end
    return pg_result
  end
end
