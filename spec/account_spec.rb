# frozen_string_literal: true

require 'account'
require 'time'

describe 'Account' do
  let(:account) { Account.new }
  let(:date) { Time.now.strftime('%d/%m/%Y') }

  describe '#deposit' do
    it 'accepts credit transaction' do
      account.deposit(10)
      expect(account.balance).to eq(10)
    end

    it 'raises an error if the deposit is zero' do
      expect { account.deposit(0) }.to raise_error('Please select another amount to deposit.')
    end

    it 'raises an error if the deposit is a negative amount' do
      expect { account.deposit(-10) }.to raise_error('Please select another amount to deposit.')
    end
  end

  describe '#withdraw' do
    it 'accepts debit transaction' do
      account.deposit(10)
      account.withdraw(10)
      expect(account.balance).to eq(0)
    end

    it 'Should subtract the withdraw ammount from the balance' do
      account.deposit(10)
      expect { account.withdraw(10) }.to change { account.balance }.by(-10)
    end

    it 'Raises an error if Insufficient funds' do
      expect { account.withdraw(10) }.to raise_error('Transaction not allowed! Insufficient funds!')
    end

    it 'raises an error if withdrawing zero' do
      expect { account.withdraw(0) }.to raise_error('Transaction not allowed! Please select an amount to withdraw.')
    end
  end

  describe '#statement_printer' do
    it 'prints the user statement' do
      account.deposit(10)
      @date = Time.now.strftime('%d/%m/%Y')
      expect { account.statement_printer }.to output(
        "date || credit || debit || balance \n #{@date} || 10 ||  || 10\n"
      ).to_stdout
    end
  end
end
