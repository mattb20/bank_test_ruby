require 'bank'
require 'date'
describe Bank do
  subject(:bank) { described_class.new }
  before do
    allow($stdout).to receive(:write)
  end
  after do
    bank.balance = 0
  end

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
  it 'has a method that prints the balance of the bank account' do
    expect{ bank.send :print_current_balance }.to output("Your current balance: £0\n").to_stdout
  end
  it 'has a method that will get a choice from the user' do
    allow(bank).to receive(:gets).and_return("1\n")
    expect(bank.send :get_user_choice).to eq 1
  end
  it 'prevents the user from withdrawing more than they have currently on balance'do
    bank.balance = 5
    expect { bank.send :check_user_has_balance, 10 }.to output("You cannot withdraw more money than you currently have in your balance\n").to_stdout
  end
  it 'has a method that will withdraw a valid amount of money from the balance' do
    bank.send :make_withdrawal, 10
    expect(bank.balance).to eq -10
  end
  it 'has a method that will store whether the user made a deposit or withdrawal in the transaction history along with the date' do
    ## arrange
    d = DateTime.now
    d.strftime("%d/%m/%Y")
    deposit_amount = 10.to_f.to_s
    ## act
    bank.send :make_deposit, 10
    ## assert
    expect(bank.transaction_history).to_include("'#{d}','#{deposit_amount}',''")

  end


end
