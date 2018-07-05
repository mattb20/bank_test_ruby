require 'transaction'
require 'date'
require 'bank'
describe Transaction do
    let(:transaction) { Transaction.new('deposit', 5) };
    let(:bank) { double :bank, :balance => 10 };
  it 'will deposit a given amount into a bank balance' do
    expect(transaction.complete(bank, 5)).to eq(15);
    end
end
