require 'transaction'
require 'date'
describe Transaction do
    let(:bank) { double 'bank' };
  it 'will deposit a given amount into a bank balance' do
    transaction = Transaction.new(bank, 'deposit', 5);
    allow(bank). to receive(:balance).and_return(10);
    allow(bank). to receive(:balance=).and_return(15);
    expect(transaction.complete(bank, 5)).to eq(15);
    end
    it 'will withdraw a given amount from a bank balance' do
      transaction = Transaction.new(bank, 'withdraw', 4);
      allow(bank). to receive(:balance).and_return(5);
      allow(bank). to receive(:balance=).and_return(1);
      expect(transaction.complete(bank, 4)).to eq(1);
    end
    it 'will call the method named complete on initialization' do
      transaction = Transaction.new(bank, 'deposit', 10);
      expect(transaction).to receive(:complete).with(bank, 10);
    end
end
