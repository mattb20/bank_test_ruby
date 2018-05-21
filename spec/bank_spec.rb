require 'bank'


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
  it 'adds the users amount to the bank balance' do
    ## act
    bank.send :make_deposit, "10"
    ## assert
    expect(bank.balance).to eq 10
  end
  it 'has a method that prevents the user from trying to deposit a non numerical amount' do
    expect{ bank.send :check_is_number, "1234h" }.to output("You can only deposit numerical amounts\nPlease enter the amount you would like to deposit\n").to_stdout
  end
  it 'has a method that will output a deposit confirmation' do
    expect{ bank.send :confirm_deposit, 10 }.to output("Deposit of £10 successful\n").to_stdout
  end
  it 'has a method that will deduct a given amount from the balance' do
    ## arrange
    bank.balance= 15
    ## act
    bank.withdraw(10)
    ## assertion
    expect(bank.balance).to eq 5

  end
end
