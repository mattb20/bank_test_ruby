require 'printer'
require 'date'
describe Printer do
  let(:printer) { described_class.new }
  let(:bank) { double 'bank', :transaction_history [["date || credit || debit || balance"],["22/05/2018", '10.00', " ", '10.00']] }
  it 'will print something as expected' do
    expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n22/05/2018 || 10.00 ||   || 10.00\n");
    printer.output(bank);
  end
end
