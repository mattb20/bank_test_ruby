require 'bank'


describe Bank do
  subject(:bank) { described_class.new }

  it 'has a default balance of 0' do
    expect(bank.balance).to eq 0
  end
  it 'has a method to ask the user to deposit a given amount and store it in the balance' do
    # act
    # assert
    expect{ bank.send :get_deposit_amount }.to output("Please enter the amount you would like to deposit\n").to_stdout
  end
  it 'adds the users amount to the bank balance' do
    ## act
    bank.send :make_deposit, "10"
    ## assert
    expect(bank.balance).to eq 10
  end
  it 'has a method that prevents the user from trying to deposit or withdraw a non numerical amount' do
    expect(bank.send :check_is_number, "1234h").to eq false
  end
  it 'has a method that will output a deposit confirmation' do
    expect{ bank.send :confirm_deposit, 10 }.to output("Deposit of £10 successful\n").to_stdout
  end
  it 'has a method that will deduct a given amount from the balance' do
    ## arrange
    bank.balance= 15
    ## act
    bank.send :subtract_from_balance, 10
    ## assertion
    expect(bank.balance).to eq 5

  end
  it 'gives the user functions to choose from' do
    expect{ bank.send :ask_user_choice }.to output("Please enter the number corresponding to what you would like to do\n").to_stdout
  end
  it 'has a method that returns possible functions of bank' do
    bank.functions = ["1) Deposit"]
    expect{bank.send :print_functions}. to output("1) Deposit\n").to_stdout
  end
end
