class Bank
  attr_accessor :balance
  def initialize
    @balance = 0
  end
  def deposit
    puts 'Please enter the amount you would like to deposit'
    deposit_money = check_is_number(get_user_amount)
    make_deposit(deposit_money)



  end
  private
  def get_user_amount
    user_input = gets.chomp
  end
  def make_deposit(amount)
    self.balance += amount.to_i
  end
  def check_is_number(object)
    if /[a-z]/=~object
      puts "You can only deposit numerical amounts"
    end
  end
end
