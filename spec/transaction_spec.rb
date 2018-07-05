require 'transaction'
require 'date'
require 'bank'
describe Transaction do
    let(:transaction) { Transaction.new };
    let(:bank) { double :bike, :balance => 10 };
  it 'will deposit a given amount into a bank balance' do
    expect(transaction.complete(bank)).to eq(15);
    end
end
