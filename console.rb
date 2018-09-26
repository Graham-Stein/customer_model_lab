require_relative('./models/pizza_order.rb')
require_relative('./models/customer.rb')
require('pry')

PizzaOrder.delete_all()
Customer.delete_all()

customer1 = Customer.new({
  "first_name" => "Jen",
  "last_name" => "Smith"
  })

customer2 = Customer.new({
  "first_name" => "Graham",
  "last_name" => "Stein"
  })

  customer1.save()
  customer2.save()

order1 = PizzaOrder.new({
  'customer_id' => customer1.id,
  'topping' => 'Pepperoni',
  'quantity' => 1
})

order2 = PizzaOrder.new({
  'customer_id' => customer1.id,
  'topping' => 'Meat!!!',
  'quantity' => 12
})

order1.save()
order2.save()

# order1.quantity = 1000
# order1.update()



orders = PizzaOrder.all()

customers = Customer.all()

customer1.orders


binding.pry
nil
