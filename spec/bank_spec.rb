require 'bank'
require 'date'
require 'transaction'
def expect_functions_to_be_printed
  expect(STDOUT).to receive(:puts).with("Please enter the number corresponding to what you would like to do")
  expect(STDOUT).to receive(:puts).with("1) Deposit")
  expect(STDOUT).to receive(:puts).with("2) Withdraw")
  expect(STDOUT).to receive(:puts).with("3) Print statement")
  expect(STDOUT).to receive(:puts).with("4) Quit")
end
def expect_user_to_choose_invalid_option
  expect(STDIN).to receive(:gets).and_return("100\n");
end

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
  it 'has a method that outputs request for user to input deposit amount' do
    #act
    #assert
    expect{ bank.send(:get_deposit_amount) }.to output("Please enter the amount you would like to deposit\n").to_stdout
  end
  it 'has a method that prevents the user from trying to deposit or withdraw a non numerical amount' do
    expect(bank.send(:check_is_number, '1234h')).to eq false
  end
  it 'has a method that will call the transaction class' do
    expect(Transaction).to receive(:new);
    bank.send(:make_transaction, 5, 'deposit');
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
  it 'gives the user an option to quit the app' do
    # arrange
    bank = Bank.new;
    $stdout.puts 'hello'
    expect(bank.functions.select{|function| /Quit/.match(function)}.size).to be >= 1
  end
  it 'gives the user a message confirmation when the user chooses to quit' do
    # arrange
    bank = Bank.new;
    some_greeting = "See you!"
    expect_functions_to_be_printed
    expect(STDIN).to receive(:gets).and_return("4\n");
    expect(STDOUT).to receive(:puts).with(some_greeting)
    bank.function;

  end

end
