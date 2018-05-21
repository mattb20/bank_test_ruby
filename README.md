### Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### My approach
- I began by reading through the requirements and decomposed them into user stories in order to better determine the objects and functionality required

### User stories
- As a user of the bank the new account I should be able to see the balance is 0
- As a user of the bank I want to deposit my money in the bank and receive a confirmation and my current balance
- As a user of the bank I want to query my balance any time while using the app
- As a user of the bank I want to withdraw a given amount of money and receive a confirmation and my current balance
- As a user of the bank, to see my recent activity, I would like to see a print out of my statement showing my activity in reverse chronological order



### How to use
- Use Ruby version 2.5.0
- Clone this repo
- Change directory into 'bank_test_ruby'
- Run 'bundle install'
- Run specs through 'rspec'
