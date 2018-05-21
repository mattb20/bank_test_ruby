require 'bank'

describe Bank do
  subject(:bank) { described_class.new }
  it 'has a default balance of 0' do
    expect(bank.balance).to eq 0
  end
  it 'has a method for the user to deposit a given amount and store it in the balance' do
    # act
    bank.deposit(10)
    # assert
    expect(bank.balance).to eq 10

  end
end
