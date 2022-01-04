# frozen_string_literal: true

class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposite(amount)
    @balance += amount
  end
end
