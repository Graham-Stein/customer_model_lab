require("pg")
require('pry')

class Customer

  attr_reader :id
  attr_accessor :first_name, :last_name


  def initialize(options)
    @id = options["id"].to_i()
    @first_name = options["first_name"]
    @last_name = options["last_name"]
  end

  def save()
    sql = "
      INSERT INTO customers (
        first_name,
        last_name
      )
      VALUES($1, $2)
      RETURNING id;
    "
    values = [
      @first_name,
      @last_name
    ]
    result = SqlRunner.run(sql, values)
    id = result[0]["id"].to_i
    @id = id
  end


  def self.delete_all()
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "
    SELECT * FROM customers;
    "
    # binding.pry
    results = SqlRunner.run(sql)
# binding.pry
    customer_objects = results.map do |result|
      Customer.new(result)
      # binding.pry
    end
    return customer_objects

  end

end
