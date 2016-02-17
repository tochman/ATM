require './lib/atm.rb'

describe ATM do
  subject do
    described_class.new(balance: 1000)
  end

  it 'returns a sucsessful message' do
    message = { status: true, message: 'success', date: Date.today.strftime("%Y-%m-%d")}
    expect(subject.withdraw(100)).to eq message
  end

  it 'rejects a withdrawal if balance = 0' do
    subject.balance = 0
    message = { status: false, message:'Insufficient funds', date: Date.today.strftime("%Y-%m-%d")}
    expect(subject.withdraw(100)).to eq message
  end
end
