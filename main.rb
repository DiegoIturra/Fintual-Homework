# Construct a simple Portfolio class that has a collection of Stocks. Assume each Stock has a “Current Price” method 
# that receives the last available price. Also, the Portfolio class has a collection of “allocated” Stocks 
# that represents the distribution of the Stocks the Portfolio is aiming (i.e. 40% META, 60% APPL)
# Provide a portfolio rebalance method to know which Stocks should be sold and which ones should be bought
# to have a balanced Portfolio based on the portfolio’s allocation.

# Add documentation/comments to understand your thinking process and solution
# Important: If you use LLMs that’s ok, but you must share the conversations.

class Portfolio
	def initialize()
		@allocated_stocks = []
		@target_allocation = {}
	end

	def rebalance()
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

	def sold()
	end

	def buy()
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
stock_3 = Stock.new("Meta", 3000)

# Se crea el portafolio y se agregan las stocks al portafolio
portfolio = Portfolio.new
portfolio.add_stock(stock_1, 20)
portfolio.add_stock(stock_2, 30)
portfolio.add_stock(stock_3, 40)

# Se setean los porcentajes objetivo
portfolio.set_target_allocation("Nvidia", 0.1)
portfolio.set_target_allocation("Apple", 0.5)
portfolio.set_target_allocation("Meta", 0.9)

portfolio.show_stocks()
