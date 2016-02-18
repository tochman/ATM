require './lib/Account.rb'
describe Account do
  subject do
    described_class.new(account_number:10, balance:500, pin_number:121, expire_date: (Date.today+1).strftime('%Y-%m-%d'), card_status:'valid')
  end
    it 'Returns nigative ammount for balance  message' do
      subject.balance =-1
      message = {status: false, message: 'Nigative ammount for balance for account', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(balance:subject.balance)).to eq message
    end
    it 'Returns no account number  message' do
      subject.account_number =''
      message = {status: false, message: 'No account number for account', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(account_number:subject.account_number)).to eq message
    end
    it 'Returns no pin number message' do
      subject.pin_number =''
      message = {status: false, message: 'No pin number for account', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(pin_number:subject.pin_number)).to eq message
    end
    it 'Returns expired account' do
      subject.expire_date =(Date.today -1).strftime('%Y-%m-%d')
      message = {status: false, message: 'Expired account', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(expire_date:subject.expire_date)).to eq message
    end
end
