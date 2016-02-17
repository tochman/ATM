require './lib/atm.rb'

describe ATM do
  subject do
    described_class.new(balance: 1000)
  end

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
end


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

describe Person do
  subject do
    described_class.new(name:'Tarek', address:'Stockhom', pin_number:10, expir_date: '2016-02-16', card_status:'valid', ammount_cash:0)
  end
    it 'Returns no name message' do
      subject.name =''
      message = {status: false, message: 'No name for pereson', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(name:subject.name)).to eq message
    end
    it 'Returns no adderss message' do
      subject.address =''
      message = {status: false, message: 'No adderss for pereson', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(address:subject.address)).to eq message
    end
    it 'Negative amount for cash' do
      subject.ammount_cash= -1
      message = {status: false, message: 'Negative amount for cash', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(ammount_cash:subject.ammount_cash)).to eq message
    end
end
