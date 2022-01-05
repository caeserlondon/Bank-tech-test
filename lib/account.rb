# frozen_string_literal: true

# the main class
class Account
  attr_reader :transactions, :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposite(credite, date)
    @balance += credite
    @transactions << [credite, date]
  end

  def withdraw(debit, date)
    @balance -= debit
    @transactions << [-debit, date]
  end
end
