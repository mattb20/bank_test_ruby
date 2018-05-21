class Bank
  attr_reader :balance
  def initialize
    @balance = 0
  end
  def deposit
    puts 'Please enter the amount you would like to deposit'
  end
end
