require 'printer'
require 'date'

describe Printer do
  let(:bank) { double('bank') }
  let(:printer) { described_class.new }
  it 'will print something as expected' do
    allow(bank).to receive(:transaction_history) { [["date || credit || debit || balance"],["22/05/2018", '10.00', " ", '10.00']] };
    expect(STDOUT).to receive(:puts).with("date || credit || debit || balance\n22/05/2018 || 10.00 ||   || 10.00\n");
    printer.output(bank);
  end

end
