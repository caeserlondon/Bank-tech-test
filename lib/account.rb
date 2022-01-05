# frozen_string_literal: true

# !/usr/bin/env ruby
# the main class
class Account
  attr_reader :transactions, :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(credit)
    raise 'Please select another amount to deposit.' if credit.zero?
    raise 'Please select another amount to deposit.' if credit.negative?

    @date = Time.now.strftime('%d/%m/%Y')
    @balance += credit
    @transactions << [@date, credit, '', balance]
    'transaction completed successfully'
  end

  def withdraw(debit)
    raise 'Transaction not allowed! Insufficient funds!' if @balance < debit
    raise 'Transaction not allowed! Please select an amount to withdraw.' if debit.zero?
    raise 'Transaction not allowed! Only positive amounts can be withdrawn.' if debit.negative?

    @date = Time.now.strftime('%d/%m/%Y')
    @balance -= debit
    @transactions << [@date, '', debit, balance]
    'transaction completed successfully'
  end

  def statement_printer
    puts 'date || credit || debit || balance '
    @transactions.map do |tr|
      puts " #{tr[0]} || #{tr[1]} || #{tr[2]} || #{tr[3]}"
    end
  end
end
