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

puts 'Welcome to Bank of Ruby...'
puts "What's the name of the account you would like to open?:"
account_name = gets.chomp
puts "Great! Your #{account_name} account has been created!"
puts 'We have auto generated an account PIN for you!'
puts 'Your PIN is 1234'
pin = 1234
puts 'How much would you like to deposit into your account?'
initial_deposit = gets.chomp.to_i
puts "Excellent! $#{initial_deposit} has been deposited into your account"
puts
a = Account.new(account_name, initial_deposit)
loop do
	puts 'Is there any thing else I can help you with today?'
	puts '--Balance : To view balance'
	puts '--Deposit : To add money to your account'
	puts '--Withdraw : To take out money from your account'
	puts '--Exit : To exit bank'

	choice = gets.chomp.downcase
	case choice
	when 'balance'
		a.display_balance(pin)
	when 'deposit'
		puts 'How much would you like to deposit?'
		answer = gets.chomp.to_i
		a.deposit(pin, answer)
	when 'withdraw'
		puts 'How much would you like to withdraw?'
		answer = gets.chomp.to_i
		a.withdraw(pin, answer)
	when 'exit'
		puts 'Thank you and have a nice day!'
		break
	else puts 'I do not understand what it is you would like me to do.'
	end
end
