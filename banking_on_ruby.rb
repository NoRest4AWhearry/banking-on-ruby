class Account
	attr_reader :name, :balance

	def initialize(name, balance=100)
		@name = name
		@balance = balance
	end

	def display_balance(pin_number)
		puts pin_number == pin ? "Balance: $#{@balance}." : pin_error
	end

	def deposit(pin_number, amount)
		if pin_number == pin
			new_balance = @balance + amount
			puts "Deposit $#{amount}. New balance: $#{new_balance}."
			@balance = new_balance
		else
			pin_error
		end
	end

	def withdraw(pin_number, amount)
		if pin_number == pin
			new_balance = @balance - amount
			puts "Withdrew $#{amount}. New balance: $#{new_balance}."
			@balance = new_balance
		else
			pin_error
		end
	end

	private

	def pin
		@pin = 1234
	end

	def pin_error
		'Access denied: incorrect PIN.'
	end
end

checking_account = Account.new('Student Checking', 1_000_000)
checking_account.display_balance(1234)
checking_account.deposit(1234,500_000)
checking_account.deposit(1234,500_000)
checking_account.withdraw(1234, 500_000)
checking_account.display_balance(1234)
checking_account.deposit(1234,500_000)
checking_account.display_balance(1234)