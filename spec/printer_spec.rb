require 'printer'
require 'bank'
require 'date'
describe Printer do
  let(:printer) { described_class.new }
  it 'will print something as expected' do
    bank = Bank.new
    bank.transaction_history = [["date || credit || debit || balance"],["22/05/2018", '10.00', " ", '10.00']]
    expect{ printer.output(bank) }.to output("date || credit || debit || balance\n22/05/2018 || 10.00 ||   || 10.00\n").to_stdout
    printer.output(bank);
  end
end
