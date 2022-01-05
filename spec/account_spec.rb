# frozen_string_literal: true

require 'account'

describe 'Account' do
  # to keep records of the account transactions
  let(:account) { Account.new }

  describe 'deposit' do
    it 'accepts credit transaction' do
      account.deposite(1)
      expect(account.transactions).to include([1])
    end
  end

  describe 'withdraw' do
    it 'accepts debit transaction' do
      account.withdraw(1)
      expect(account.transactions).to include([-1])
    end
  end
end
