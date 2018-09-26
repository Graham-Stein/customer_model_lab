require_relative('./models/pizza_order.rb')
require_relative('./models/customer.rb')
require('pry')

PizzaOrder.delete_all()
Customer.delete_all()

order1 = PizzaOrder.new({
  'first_name' => 'Walter',
  'last_name' => 'White',
  'topping' => 'Pepperoni',
  'quantity' => 1
})

order2 = PizzaOrder.new({
  'first_name' => 'Jessie',
  'last_name' => 'James',
  'topping' => 'Meat!!!',
  'quantity' => 12
})

order1.save()
order2.save()

# order1.quantity = 1000
# order1.update()

orders = PizzaOrder.all()


customer1 = Customer.new({
  "first_name" => "Jen",
  "last_name" => "Smith"
  })

customer1.save

binding.pry
nil
