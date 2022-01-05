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

  def statement_printer
    puts 'date || credit || debit || balance'
    @transactions.map do |tr|
      puts "#{tr[0]} || #{tr[1]} || #{tr[2]} || #{tr[3]}"
    end
  end
end
