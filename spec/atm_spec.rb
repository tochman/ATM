require './lib/atm.rb'

describe ATM do
  subject do
    described_class.new(balance:1000)
  end
  it 'returns a sucsessful message' do
    message = { status: true, message: 'success' }
    expect(subject.withdraw(100)).to eq message
  end
end
