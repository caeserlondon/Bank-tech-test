# frozen_string_literal: true

require 'account'

describe 'Account' do
  # to keep records of the account transactions
  let(:account) { Account.new }

  describe 'deposit' do
    it 'accepts credit transaction' do
      account.deposite(10, '10-01-2023')
      expect(account.transactions).to include([10, '10-01-2023'])
    end
  end

  describe 'withdraw' do
    it 'accepts debit transaction' do
      account.withdraw(10, '14-01-2023')
      expect(account.transactions).to include([-10, '14-01-2023'])
    end
  end
end
