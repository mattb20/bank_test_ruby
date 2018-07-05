class Transaction
  attr_reader :transaction_type, :amount
  def initialize(transaction_type, amount)
    @transaction_type = transaction_type
    @amount = amount
  end
  def complete(bank, amount)
    case self.transaction_type
    when 'deposit'
      bank.balance += amount;

    end
  end
end
