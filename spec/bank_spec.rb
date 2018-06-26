require 'bank'
require 'date'
describe Bank do
  subject(:bank) { described_class.new }
  before do
    allow(STDOUT).to receive(:write)
    allow(STDOUT).to receive(:puts)
    allow(STDIN).to receive(:gets)
  end
  after do
    bank.balance = 0
    bank.transaction_history = []
  end
  it 'has a default balance of 0' do
    expect(bank.balance).to eq 0
  end
  it 'has a method to ask the user to deposit a given amount and store it in the balance' do
    #act
    #assert
    expect{ bank.send(:get_deposit_amount) }.to output("Please enter the amount you would like to deposit\n").to_stdout
  end
  it 'adds the users amount to the bank balance' do
    #act
    bank.send :make_deposit, '10'
    #assert
    expect(bank.balance).to eq 10
  end
  it 'has a method that prevents the user from trying to deposit or withdraw a non numerical amount' do
    expect(bank.send(:check_is_number, '1234h')).to eq false
  end
  it 'has a method that will output a deposit confirmation' do
    expect{ bank.send(:confirm_deposit, 10) }.to output("Deposit of £10 successful\n").to_stdout
  end
  it 'has a method that will output a withdrawal confirmation' do
    expect{ bank.send(:confirm_withdrawal, 10) }.to output("Withdrawal of £10 successful\n").to_stdout
  end
  it 'has a method that will deduct a given amount from the balance' do
    #arrange
    bank.balance= 15
    #act
    bank.send :subtract_from_balance, 10
    #assertion
    expect(bank.balance).to eq 5
  end
  it 'gives the user functions to choose from' do
    expect{ bank.send :ask_user_choice }.to output("Please enter the number corresponding to what you would like to do\n").to_stdout
  end
  it 'has a method that returns possible functions of bank' do
    bank.functions = ["1) Deposit"]
    expect{bank.send(:print_functions)}. to output("1) Deposit\n").to_stdout
  end
  it 'has a method that prints the balance of the bank account' do
    expect{ bank.send :print_current_balance }.to output("Your current balance: £0\n").to_stdout
  end
  it 'has a method that will get a choice from the user' do
    expect(STDIN).to receive(:gets).and_return("1\n")
    expect(bank.send(:get_user_choice)).to eq ("1")
  end
  it 'prevents the user from withdrawing more than they have currently on balance'do
    bank.balance = 5
    expect { bank.send :check_user_has_balance, 10 }.to output("You cannot withdraw more money than you currently have in your balance\n").to_stdout
  end
  it 'has a method that will withdraw a valid amount of money from the balance' do
    expect(bank.send :make_withdrawal, 10).to eq -10
  end
  it 'has a method that will store whether the user made a deposit or withdrawal in the transaction history along with the date' do
    #arrange
    d = DateTime.now.strftime("%d/%m/%Y")
    deposit_amount = '10.00'
    #act
    bank.send :update_transaction_history, 'deposit', deposit_amount
    #assert
    expect(bank.transaction_history[1]).to eq(["#{d}","#{deposit_amount}",' ','%.2f' % bank.balance.to_i])
  end
  it 'has a method that will print out the transaction history in the required format' do
    bank.transaction_history = [["date || credit || debit || balance"],["22/05/2018", '10.00', " ", '10.00']]
    expect{ bank.send :print_transaction_history, bank.transaction_history }.to output("date || credit || debit || balance\n22/05/2018 || 10.00 ||   || 10.00\n").to_stdout
  end
  it 'allows the user to successfully deposit an amount' do
    # arrange
    bank = Bank.new;
    bank.functions = ["1) Deposit"]
    expect(STDOUT).to receive(:puts).with('1) Deposit');
    expect(STDOUT).to receive(:puts).with('Please enter the number corresponding to what you would like to do');
    expect(STDIN).to receive(:gets).and_return("1\n");
    expect(STDOUT).to receive(:puts).with('Please enter the amount you would like to deposit/withdraw');
    expect(STDIN).to receive(:gets).and_return("10\n");
    expect(STDOUT).to receive(:puts).with("Deposit of £10 successful");
    expect(STDOUT).to receive(:puts).with("Your current balance: £10");
    bank.function;
  end
  it 'will ask the user for another withdrawal amount if they enter an amount that is not a valid(will take balance < 0)' do
    # arrange
    bank = Bank.new;
    bank.balance = 2;
    expect(STDOUT).to receive(:puts).with('Please enter the amount you would like to deposit/withdraw');
    expect(STDIN).to receive(:gets).and_return("5\n");
    expect(STDOUT).to receive(:puts).with('You cannot withdraw more money than you currently have in your balance');
    expect(STDOUT).to receive(:puts).with('Please enter the amount you would like to deposit/withdraw');
    expect(STDIN).to receive(:gets).and_return("2\n");
    expect(STDOUT).to receive(:puts).with("Withdrawal of £2 successful");
    expect(STDOUT).to receive(:puts).with("Your current balance: £0");
    bank.send(:apply_choice, 2)
  end
  it 'gives the user an option to quit the app' do
    # arrange
    bank = Bank.new;
    $stdout.puts 'hello'
    expect(bank.functions.select{|function| function == "1) Deposit"}).to be(nil)
  end
end
