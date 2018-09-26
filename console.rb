require_relative('./models/pizza_order.rb')
require('pry')

PizzaOrder.delete_all()

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

binding.pry
nil
