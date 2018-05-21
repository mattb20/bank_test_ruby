class Bank
  attr_accessor :balance
  def initialize
    @balance = 0
  end
  def deposit
    puts 'Please enter the amount you would like to deposit'
    make_deposit(get_user_amount)

  end
  private
  def get_user_amount
    gets.chomp
  end
  def make_deposit(amount)
    self.balance += amount.to_i
  end
end
