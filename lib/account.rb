# frozen_string_literal: true

# the main class
class Account
  attr_reader :transactions, :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(credite, date)
    @balance += credite
    @transactions << [credite, date]
  end

  def withdraw(debit, date)
    raise 'Error! Insufficient funds' if (@balance - debit).negative?

    @balance -= debit
    @transactions << [-debit, date]
  end
end
