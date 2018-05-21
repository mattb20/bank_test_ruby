require 'bank'
require 'simplecov'

describe Bank do
  subject(:bank) { described_class.new }
  it 'has a default balance of 0' do
    expect(bank.balance).to eq 0
  end
  it 'has a method to ask the user to deposit a given amount and store it in the balance' do
    # act
    # assert
    expect{ bank.deposit }.to output("Please enter the amount you would like to deposit\n").to_stdout
  end
end
