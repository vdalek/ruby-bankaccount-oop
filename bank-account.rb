class BankAccount
	attr_accessor :account_number, :balance, :checking_balance, :savings_balance, :overall_balance
	@account_counter = 0

	class << self
		attr_accessor :account_counter
	end

	protected
	def initialize
		generate_account
		@checking_balance = 100
		@savings_balance = 50
		@interest_rate = 0.10
		self.class.account_counter += 1
		puts "Thank you for setting up a new account! :)"
	end
	def checkingBalance
		puts @checking_balance
		self
	end
	def savingsBalance
		puts @savings_balance
		self
	end
	def deposit(num, account)
		if account == "savings" 
			@savings_balance += num
		elsif account == "checking" 
			@checking_balance += num
		else
			puts "Sorry...that account does not exist"
		end
		self
	end
	def withdrawl(amount, account)
		if account == "savings"
			if (@savings_balance - amount) < 0
				puts "Sorry...insufficient funds"
			else
				@savings_balance -= amount
			end
		elsif account == "checking"
			if (@checking_balance - amount) < 0
				puts "Sorry...insufficient funds"
			else
				@checking_balance -= amount
			end
		else
			puts "Sorry...that account does not exist"
		end
		self
	end
	def overallBalance
		@overall_balance = @savings_balance + @checking_balance
		self
	end
	def account_information
		puts "Your Account Number is #{@account_number}"
		overallBalance
		puts "Your total balance is #{@overall_balance}"
		puts "Your checking account balance is #{@checking_balance}"
		puts "Your savings account balance is #{@savings_balance}"
		puts "Interest Rate is #{@interest_rate}"
	end

	private
	attr_accessor :interest_rate

	def generate_account
		@account_number = rand(10000..99999)
	end
end

# BankAccount.new.checkingBalance.deposit(500, "checking").checkingBalance.withdrawl(700, "checking")
# BankAccount.new.deposit(500, "savings").deposit(500, "checking").overallBalance
BankAccount.new.account_information