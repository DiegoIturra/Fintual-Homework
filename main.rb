class Portfolio
	def initialize()
		@allocated_stocks = []
		@target_allocation = {}
	end

	def rebalance()
		validate_and_normalize_allocations()

		total = get_total_value()

		@allocated_stocks.each do |allocation|
			
			current_stock = allocation[:stock]

			current_value = current_stock.price * allocation[:units]

			target_percentage = @target_allocation[current_stock.name] || 0

			target_value = total * target_percentage

			difference = target_value - current_value

			if difference > 0
				puts "Deberia comprar #{difference / current_stock.price} unidades de #{current_stock.name}, faltan $#{difference}"
			elsif difference < 0
				puts "Deberia vender #{difference.abs / current_stock.price} unidades de #{current_stock.name}, sobran $#{difference.abs}"
			else	
				puts "stock #{current_stock.name} está balanceado"
			end

		end
	end

	def add_stock(stock, units)
		@allocated_stocks << { stock: stock, units: units }
	end

	def set_target_allocation(stock_name, percentage)
		@target_allocation[stock_name] = percentage
	end

	def show_stocks()
		@allocated_stocks.each do |stock|
			puts "Stock name: #{stock[:stock].name}, Stock price #{stock[:stock].price}, Stock units: #{stock[:units]}"
		end

		puts "total_value: #{get_total_value}"
	end

	private
	def get_total_value
		total_value = @allocated_stocks.sum{ |allocation| allocation[:stock].price * allocation[:units]}
		return total_value
	end

	def validate_and_normalize_allocations
		total = @target_allocation.values.sum
		return if total == 0

		if total < 1.0 or total > 1.0
			puts "normalizing values before rebalance"
		end

		@target_allocation.transform_values! { |value| value / total }
	end
end

class Stock

	attr_reader :price, :name

	def initialize(name, price)
		@name = name
		@price = price
	end

	def current_price(last_available_price)
		@price = last_available_price
	end

end

# Se crean las stock con nombre y precio
stock_1 = Stock.new("Nvidia", 1000)
stock_2 = Stock.new("Apple", 2000)
stock_3 = Stock.new("Meta", 5000)

# Se crea el portafolio y se agregan las stocks al portafolio
portfolio = Portfolio.new
portfolio.add_stock(stock_1, 10)
portfolio.add_stock(stock_2, 15)
portfolio.add_stock(stock_3, 20)

# Se setean los porcentajes objetivo
portfolio.set_target_allocation("Nvidia", 0.2)
portfolio.set_target_allocation("Apple", 0.2)
portfolio.set_target_allocation("Meta", 0.6)


portfolio.rebalance
