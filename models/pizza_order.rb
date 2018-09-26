require('pg')
require_relative('../db/sql_runner.rb')
class PizzaOrder

  attr_accessor(:topping, :quantity)
  attr_reader(:id, :customer_id)

  def initialize(options)
    @id = options['id'].to_i()
    @customer_id = options['customer_id'].to_i()
    @topping = options['topping']
    @quantity = options['quantity'].to_i()
  end

  def customer()
    # we have @customer_id
    sql "
    SELECT * FROM customers
    WHERE id = $1;
    "
    results = SqlRunner.run(sql, [@customer_id])
    customer_hash = results[0]
    customer = Customer.new(customer_hash)
    return customer
    # return a customer object
  end

  def self.delete_all()
    sql = 'DELETE FROM pizza_orders;'
    SqlRunner.run(sql)
    # db = PG.connect({
    #   dbname: 'pizza_shop',
    #   host: 'localhost'
    # })
    # db.exec(sql)
    # db.close()
  end

  def self.all()
    sql = 'SELECT * FROM pizza_orders;'

    order_hashes = SqlRunner.run(sql)
    # order_hashes = db.exec_prepared('all')

    order_objects = order_hashes.map do |order_hash|
      PizzaOrder.new(order_hash)
    end

    return order_objects
  end

  def save()
    sql = "
      INSERT INTO pizza_orders (
        customer_id,
        quantity,
        topping
      )
      VALUES ($1, $2, $3)
      RETURNING id;
    "
    values = [
      @customer_id,
      @quantity,
      @topping
    ]
    result = SqlRunner.run(sql, values)
    result_hash = result[0]
    string_id = result_hash['id']
    id = string_id.to_i()
    @id = id
  end

  def update()
    db = PG.connect({
      dbname: 'pizza_shop',
      host: 'localhost'
    })
    sql = "
      UPDATE pizza_orders
      SET (
        first_name,
        last_name,
        topping,
        quantity
      ) = ( $1, $2, $3, $4 )
      WHERE id = $5;
    "
    values = [
      @first_name,
      @last_name,
      @topping,
      @quantity,
      @id
    ]
    db.prepare('update', sql)
    db.exec_prepared('update', values)
    db.close()
  end

end
