require './lib/atm.rb'

describe ATM do
  it 'returns a sucsessful message' do
    message = { status: true, message: 'success' }
    expect(subject.withdraw(100)).to eq message
  end
end
