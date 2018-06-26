require 'rugged'
require 'linguist'

repo = Rugged::Repository.new('.')
Linguist::Repository.new(repo, repo.head.target_id)
require './lib/bank'
bank = Bank.new
bank.function
