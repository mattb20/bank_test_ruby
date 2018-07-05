class Printer
  def initialize
  end
  def output(bank)
    bank.transaction_history.each do |transaction|
      puts transaction.join( ' || ')
  end
  end
end
