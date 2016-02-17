require './lib/Account.rb'
describe Account do
  subject do
    described_class.new(ammount:500, pin_number:121)
  end
    it 'Returns nigative ammount for balance  message' do
      subject.balance =-1
      message = {status: false, message: 'Nigative ammount for balance for account', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(balance:subject.balance)).to eq message
    end
    it 'Returns no pin number message' do
      subject.pin_number =''
      message = {status: false, message: 'No pin number for account', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(pin_number:subject.pin_number)).to eq message
    end
end
