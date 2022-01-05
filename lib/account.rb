# frozen_string_literal: true

# the main class
class Account
  attr_reader :transactions, :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(credit, date)
    @balance += credit
    @transactions << [date, credit, '', balance]
  end

  def withdraw(debit, date)
    raise 'Error! Insufficient funds' if (@balance - debit).negative?

    @balance -= debit
    @transactions << [date, '', debit, balance]
  end
end
