# frozen_string_literal: true

require 'account'

describe Account do
  describe 'deposit' do
    it 'Adds the deposite value to the balance' do
      account = Account.new
      expect { account.deposite(1) }.to change { account.balance }.by(1)
    end

    it 'Record the transactions in the transactions log' do
      account = Account.new
      expect { account.deposite(1) }.to change { account.transactions_log.size }.by(1)
    end
  end

  describe 'withdraw' do
    it 'Should subtract the withdrawal amount from the balance' do
      account = Account.new
      account.deposite(1)
      expect { account.withdraw(1) }.to change { account.balance }.by(-1)
    end

    it 'Records the transaction to the transaction log' do
      account = Account.new
      account.deposite(1)
      expect { account.withdraw(1) }.to change { account.transactions_log.length }.by(1)
    end
  end
end
