class Customer
	attr_accessor :firstname, :lastname
	def initialize(fname, lname)
		@firstname = fname
		@lastname = lname
	end
end

class Order
	attr_accessor :client, :sum
	def initialize(customer, total)
		@client = customer
		@sum = total
	end
end

$i = 0
$ordersArray = Array.new(5, Order)

class Shop
	def initialize(name)
		@Shopname = name
	end
	def register_order(customer, sum) 
		$ordersArray[$i] = Order.new(customer, sum)
	end
	def orders_for(customer)
		@cust_sum = 0
		puts customer.firstname + ' ' + customer.lastname
		$ordersArray.each{
			|x|
			if x.client.firstname == customer.firstname
				puts x.sum
				@cust_sum += x.sum
			end
		}
		puts "Total = #{@cust_sum}"
	end
	def orders_summary
		@total_sum = 0
		puts "All orders:"
		$ordersArray.each{
			|x|
			puts x.client.firstname + ' ' + x.client.lastname + " #{x.sum}"
			@total_sum += x.sum
		}
		puts "Total sum for all orders = #{@total_sum}"
	end
end

main_shop = Shop.new('Our\'s')

customer1 = Customer.new('Smith','John')
main_shop.register_order(customer1, 1200)
$i += 1

customer2 = Customer.new('Roy','Peter')
main_shop.register_order(customer2, 1000)
$i += 1
main_shop.register_order(customer2, 2000)
$i += 1

customer3 = Customer.new('Evan', 'Josh')
main_shop.register_order(customer3, 1500)
$i += 1
main_shop.register_order(customer3, 600)

main_shop.orders_for(customer1);
main_shop.orders_for(customer2);
main_shop.orders_for(customer3);
main_shop.orders_summary;
