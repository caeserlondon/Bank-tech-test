# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { Account.new }

  describe '#deposit' do
    it 'accepts credit transaction' do
      account.deposit(10, '10-01-2023')
      expect(account.transactions).to include(['10-01-2023', 10, '', 10])
    end

    it 'Adds the deposit value to the balance' do
      expect { account.deposit(10, '10-01-2023') }.to change { account.balance }.by(10)
    end

    it 'raises an error if the deposit is zero' do
      expect { account.deposit(0, '10-01-2023') }.to raise_error('Transaction not allowed! Please select another amount to deposit.')
    end
    it 'raises an error if the deposit is a negative amount' do
      expect do
        account.deposit(-10,
                        '10-01-2023')
      end.to raise_error('Transaction not allowed! Please select a positive amount to deposit.')
    end
  end

  describe '#withdraw' do
    it 'accepts debit transaction' do
      account.deposit(10, '10-01-2023')
      account.withdraw(10, '14-01-2023')
      expect(account.transactions).to include(['14-01-2023', '', 10, 0])
    end

    it 'Should subtract the withdraw ammount from the balance' do
      account.deposit(10, '10-01-2023')

      expect { account.withdraw(10, '14-01-2023') }.to change { account.balance }.by(-10)
    end

    it 'Raises an error if Insufficient funds' do
      expect { account.withdraw(10, '14-01-2023') }.to raise_error('Transaction not allowed! Insufficient funds!')
    end

    it 'raises an error if withdrawing zero' do
      expect { account.withdraw(0, '14-01-2023') }.to raise_error('Transaction not allowed! Please select an amount to withdraw.')
    end
  end

  describe '#statement_printer' do
    it 'prints the user statement' do
      account.deposit(10, '10-01-2023')
      expect do
        account.statement_printer
      end.to output("date || credit || debit || balance\n10-01-2023 || 10 ||  || 10\n").to_stdout
    end
  end
end
