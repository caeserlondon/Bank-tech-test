# frozen_string_literal: true

# the main class
class Account
  attr_reader :transactions, :balance

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(credit, date)
    raise 'Transaction not allowed! Please select another amount to deposit.' if credit.zero?
    raise 'Transaction not allowed! Please select a positive amount to deposit.' if credit.negative?

    @balance += credit
    @transactions << [date, credit, '', balance]
    'transaction completed successfully'
  end

  def withdraw(debit, date)
    raise 'Transaction not allowed! Insufficient funds!' if @balance < debit
    raise 'Transaction not allowed! Please select an amount to withdraw.' if debit.zero?
    raise 'Transaction not allowed! Only positive amounts can be withdrawn.' if debit.negative?

    @balance -= debit
    @transactions << [date, '', debit, balance]
    'transaction completed successfully'
  end

  def statement_printer
    puts 'date || credit || debit || balance'
    @transactions.map do |tr|
      puts "#{tr[0]} || #{tr[1]} || #{tr[2]} || #{tr[3]}"
    end
  end
end
