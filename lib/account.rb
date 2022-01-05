# frozen_string_literal: true

# the main class
class Account
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposite(amount)
    @transactions << [amount]
  end

  def withdraw(amount)
    @transactions << [-amount]
  end
end
