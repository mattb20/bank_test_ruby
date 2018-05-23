require 'date'
class Bank
  def initialize
    @balance = 0
    @functions = ["1) Deposit", "2) Withdraw ", "3) Print statement"]
    #Transactions will be stored in the following format inside history: [date, credit, debit, balance]
    @transaction_history = [["date || credit || debit || balance"]]
  end
  def function
    ask_user_choice
    print_functions
    user_choice = get_user_choice
    apply_choice(user_choice.to_i)
  end

  private
  def apply_choice(choice)
    case choice
      when 1
        deposit_amount = get_valid_user_amount
        make_deposit(deposit_amount)
        confirm_deposit(deposit_amount)
        print_current_balance
        update_transaction_history('deposit', deposit_amount)
      when 2
        withdrawal_amount = get_valid_user_amount
        while !check_user_has_balance(withdrawal_amount)
          withdrawal_amount = get_valid_user_amount
        end
        make_withdrawal(withdrawal_amount)
        update_transaction_history('withdrawal', withdrawal_amount)

      when 3
        print_transaction_history(self.transaction_history)
    end
  end
  def get_valid_user_amount
    puts 'Please enter the amount you would like to deposit/withdraw'
    user_input = gets.chomp
    while !check_is_number(user_input)
      puts "You can only deposit/withdraw numerical amounts"
      get_valid_user_amount
    end
    return user_input
  end
  def ask_user_choice
    puts "Please enter the number corresponding to what you would like to do"
  end
  def make_deposit(amount)
    self.balance += amount.to_i
    confirm_deposit(amount)
  end
  def check_user_has_balance(amount)
    if amount.to_i > self.balance
      puts "You cannot withdraw more money than you currently have in your balance"
      false
    else
      true
    end
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
  def make_withdrawal(amount)
    self.balance -= amount
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
  def get_user_choice
    user_choice = gets.chomp.to_i
    if 0 < user_choice && user_choice <= self.functions.length
      return user_choice
    else
      puts "That is not a valid choice"
      get_user_choice
    end
  end
  def get_deposit_amount
    puts 'Please enter the amount you would like to deposit'
  end
  def update_transaction_history(action, amount)
    if action == 'deposit'
      today_date = DateTime.now.strftime("%d/%m/%Y")
      self.transaction_history.push([today_date, '%.2f' % amount.to_i, ' ', '%.2f' % self.balance.to_i])
    elsif action == 'withdraw'
    end
  end
  def print_transaction_history(history)
    #the account history will be printed on new lines separating each transaction with the header date || credit || debit || balance
    history.each do |transaction|
      puts transaction.join(" || ")
    end
  end
  public
  attr_accessor :balance
  attr_accessor :functions
  attr_accessor :transaction_history
end
