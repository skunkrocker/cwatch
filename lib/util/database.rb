require 'fileutils'

class Database

  def initialize
    db_file = "#{Dir.home}/.portfolio.db"
    FileUtils.touch db_file unless File.exist? db_file

    begin
      @db = SQLite3::Database.new db_file
      @db.execute <<-SQL
          CREATE TABLE IF NOT EXISTS coin(
            amount REAL,
            rate REAL,
            fees REAL, 
            token TEXT,
            fiat TEXT
           )
      SQL
    rescue SQLite3::Exception => e
      puts 'failed to load the db'.red
    end
  end

  def add(options)
    begin
      @db.execute "INSERT INTO coin (amount, rate, fees, token, fiat) VALUES (?,?,?,?,?)",
                  options[:a], options[:r], options[:c], options[:t], options[:f]
    rescue SQLite3::Exception => e
      puts e.message || 'could not add the coin buy to the portfolio'
    end
  end

  def all
    begin
      @db.execute "select * from coin"
    rescue SQLite3::Exception => e
      puts e.message || 'could not read the coins from portfolio'
    end
  end

  def all_for_token(token)
    begin
      @db.execute "select * from coin where token = ?", token
    rescue SQLite3::Exception => e
      puts e.message || 'could not read the coins from portfolio'
    end
  end

  def dispose
    @db.close if @db
  end
end