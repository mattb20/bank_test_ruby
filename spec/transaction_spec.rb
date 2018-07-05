require 'transaction'
require 'date'
require 'bank'
describe Transaction do
    let(:transaction) { Transaction.new('deposit', 5) };
    let(:bank) { double 'bank' };
  it 'will deposit a given amount into a bank balance' do
    allow(bank). to receive(:balance).and_return(10);
    allow(bank). to receive(:balance=).and_return(15);
    expect(transaction.complete(bank, 5)).to eq(15);
    end
end
