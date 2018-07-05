class Transaction
  def complete(bank, amount)
    case self.transaction_type
    when 'deposit'
      bank.balance += amount;

    end
  end
end
