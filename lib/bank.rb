require 'pry'
class Bank
  attr_accessor :balance
  attr_accessor :functions
  def initialize
    @balance = 0
    @functions = ["1) Deposit", "2) Withdraw ", "3) Print statement"]
  end
  def function
    ask_user_choice
    print_functions
  end

  private
  def get_valid_user_amount
    user_input = gets.chomp
    while !check_is_number(user_input)
      puts "You can only deposit/withdraw numerical amounts"
      get_valid_user_amount
    end
    make_deposit(user_input)
  end
  def ask_user_choice
    puts "Please enter the number corresponding to what you would like to do"
  end
  def make_deposit(amount)
    self.balance += amount.to_i
    confirm_deposit(amount)
  end
  def check_is_number(object)
    if /[a-z-]/=~object
      false
    else
      true
    end
  end
  def confirm_deposit(amount)
    puts "Deposit of £" + amount.to_s + " successful"
  end
  def print_current_balance
    puts "Your current balance: £#{self.balance}"
  end
  def print_functions
    self.functions.each do |function|
      puts function
    end
  end
  def subtract_from_balance(amount)
    self.balance -= amount
  end
  def get_deposit_amount
    puts 'Please enter the amount you would like to deposit'
  end
end
