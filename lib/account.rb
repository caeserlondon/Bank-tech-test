# frozen_string_literal: true

# the main class
class Account
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def deposite(credite, date)
    @transactions << [credite, date]
  end

  def withdraw(debit, date)
    @transactions << [-debit, date]
  end
end
