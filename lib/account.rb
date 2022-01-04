# frozen_string_literal: true

# the main class
class Account
  attr_reader :balance, :transactions_log

  def initialize
    @balance = 0
    @transactions_log = []
  end

  def deposite(amount)
    @balance += amount
    transactions_log.push(amount)
  end

  def withdraw(amount)
    raise 'Error! Insufficient funds' if (@balance - amount).negative?
    @balance -= amount
    transactions_log.push(-amount)
  end
end
