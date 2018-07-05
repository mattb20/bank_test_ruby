class Transaction
  attr_reader :transaction_type
  def initialize(bank, transaction_type, amount)
    @transaction_type = transaction_type
  end
  def complete(bank, amount)
    case self.transaction_type
    when 'deposit'
      bank.balance += amount;

    end
  end
end
