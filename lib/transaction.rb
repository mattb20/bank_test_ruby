class Transaction
  attr_reader :transaction_type
  def initialize(bank, transaction_type, amount)
    @transaction_type = transaction_type
  end
  def complete(bank, amount)
    self.transaction_type == 'deposit' ? bank.balance += amount.to_i : bank.balance -= amount.to_i;
  end
  def confirm(amount)
    puts self.transaction_type.capitalize + ' of ' + '£' + amount.to_s + ' successful!'
  end
end
