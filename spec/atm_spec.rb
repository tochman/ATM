require './lib/atm.rb'

describe ATM do
  subject do
    described_class.new(balance: 100)
  end

  let(:owner) {double(:person, cash: 0)}

  let(:account) { double(:account, owner: owner, pin_number: 1234, balance: 100, card_status: :active) }

  before do
    allow(account).to receive(:balance=)
    allow(owner).to receive(:cash=)
  end

  it 'Rejects if user enters wrong pin number' do
    binding.pry
    message = {status: false, message: 'Error. Invalid pin number', date: Date.today.strftime('%Y-%m-%d')}
    expect(subject.withdraw(account, 1235, 50)).to eq message
  end

  it 'Rejects a withdrawal if amount is bigger than balance' do
    message = {status: false, message: 'Insufficient funds', date: Date.today.strftime('%Y-%m-%d')}
    expect(subject.withdraw(account, 1234, 150)).to eq message
  end

  it 'rejects a withdrawal if amount is not divisible by 5' do
    message = {status: false, message: 'Amount not divisible by 5', date: Date.today.strftime('%Y-%m-%d')}
    expect(subject.withdraw(account, 1234, 9)).to eq message
  end

  it 'Returns a sucsessful message if transaction accomplished' do
    message = {status: true, message: 'Success', amount: 50, date: Date.today.strftime('%Y-%m-%d')}
    expect(subject.withdraw(account, 1234, 50)).to eq message
  end

  it 'rejects if card is not active' do
    allow(account).to receive(:card_status).and_return(:inactive)
    allow(account).to receive(:balance).and_return(50)
    message = {status: false, message: 'Card has been deactivated', date: Date.today.strftime('%Y-%m-%d')}
    expect(subject.withdraw(account, 1234, 50)).to eq message

  end

end
