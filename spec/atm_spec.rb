require './lib/atm.rb'

describe ATM do
  subject do
    described_class.new(balance: 100)
  end

  let(:account) {double(:account, pin_number: 1234, balance: 100)}


  it 'Rejects if user enters wrong pin number' do
    message = { status: false, message: 'Error. Invalid pin number', amount: 50}
    expect(subject.withdraw(account, 1235, 50)).to eq message
  end

  it 'Rejects a withdrawal if ammount is bigger than balance' do
    message = { status: false, message: 'Insufficient funds'}
    expect(subject.withdraw(account, 1234, 150)).to eq message
  end

  it 'rejects a withdrawal if amount is not divisible by 5' do
    message = { status: false, message: 'Amount not divisible by 5'}
    expect(subject.withdraw(account,1234,9)).to eq message
  end

  it 'Returns a sucsessful message if transaction accomplished' do
    message = { status: true, message: 'Success',balance: account.balance - 50}
    expect(subject.withdraw(account, 1234, 50)).to eq message
    end

  #
  # xit 'rejects a withdrawal if amount is not divisible by 5' do
  #   message = { status: false, message: 'Amount not divisible by 5', date: Date.today.strftime('%Y-%m-%d')}
  #   expect(subject.withdraw(9)).to eq message
  # end
  #
  # it 'rejects if user enters wrong pin number' do
  #
  # end
end
