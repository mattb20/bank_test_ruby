class Bank
  attr_accessor :balance
  def initialize
    @balance = 0
  end
  def deposit
    puts 'Please enter the amount you would like to deposit'
    amount_to_deposit = get_valid_user_amount
    make_deposit(amount_to_deposit)
  end

  private
  def get_valid_user_amount
    user_input = gets.chomp
    if check_is_number(user_input)
      return user_input
    end
  end
  def make_deposit(amount)
    self.balance += amount.to_i
  end
  def check_is_number(object)
    if /[a-z]/=~object
      puts "You can only deposit numerical amounts"
      deposit
    end
    true
  end
  def confirm_deposit(amount)
    puts "Deposit of £" + amount.to_s + " successful"
  end
end
