require_relative('../db/sql_runner')
require("pry")

class House

  attr_reader :house_name, :logo, :id

  def initialize(options)
    @id = options['id'].to_i
    @house_name = options['house_name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses (house_name, logo) VALUES ('#{@house_name}', '#{@logo}') RETURNING*;"
    details = SqlRunner.run(sql)
    @id = details.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses;"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def self.find( id )
    sql = "SELECT * FROM houses WHERE id=#{id};" 
    # self.find(beard) must match WHERE id=#@{beard}???????
    house = SqlRunner.run( sql )
    result = House.new( house.first )
    return result
  end

  def self.delete_all
    sql = "Delete from houses;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM houses WHERE id=#{ @id };"
    SqlRunner.run( sql )
  end
end