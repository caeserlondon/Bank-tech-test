# frozen_string_literal: true

require 'account'

describe Account do
  it 'Adds the deposite value to the balance' do
    account = Account.new
    expect { account.deposite(1) }.to change { account.balance }.by(1)
  end
end
