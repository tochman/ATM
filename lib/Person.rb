require './lib/account.rb'

class Person
  attr_accessor :name, :cash, :accounts

  def initialize(options = {})
      @name = options[:name]
      @cash = options[:cash]
      @accounts = []
  end

  def open_account(options={})
    account = Account.new(self, balance: options[:deposit])
    @accounts << account
    binding.pry
  end
end
