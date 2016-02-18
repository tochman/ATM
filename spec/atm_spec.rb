require './lib/atm.rb'

describe ATM do
  subject do
    described_class.new(balance: 1000)
  end

  let(:account) {double(:account, pin_number: 1234, balance: 100)}

  it 'returns a sucsessful message' do
    message = { status: true, message: 'Success', date: Date.today.strftime('%Y-%m-%d'), amount: 100}
    expect(subject.withdraw(100)).to eq message
  end

  it 'rejects a withdrawal if balance = 0' do
    subject.balance = 0
    message = { status: false, message: 'Insufficient funds', date: Date.today.strftime('%Y-%m-%d')}
    expect(subject.withdraw(100)).to eq message
  end

  it 'rejects a withdrawal if amount is not divisible by 5' do
    message = { status: false, message: 'Amount not divisible by 5', date: Date.today.strftime('%Y-%m-%d')}
    expect(subject.withdraw(9)).to eq message
  end

  it 'accepts if user enters right pin number' do
    subject.withdraw(account, 1234, 50)
    message = { status: true, message: 'Success', date: Date.today.strftime('%Y-%m-%d'), amount: 50}
    expect(subject.withdraw(account, 1234, 50)).to eq message
  end

  it 'rejects if user enters wrong pin number' do

  end
end
