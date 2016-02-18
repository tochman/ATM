require './lib/person.rb'

describe Person do
  subject do
    described_class.new(name:'Tarek', cash: 0)
  end

  describe 'after creation' do
    it 'has a name' do
      expect(subject.name).to eq 'Tarek'
    end

    it 'has cash' do
      expect(subject.cash).to eq 0
    end
  end

  it 'allows person to open an account' do
    subject.open_account(deposit: 100)
    expect(subject.accounts.first.balance).to eq 100
  end


    xit 'Returns no name message' do
      subject.name =''
      message = {status: false, message: 'No name for pereson', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(name:subject.name)).to eq message
    end

    xit 'Negative amount for cash' do
      subject.cash= -1
      message = {status: false, message: 'Negative amount for cash', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(cash:subject.cash)).to eq message
    end

    xit 'No pin number for pereson' do
      subject.pin_number= ''
      message = {status: false, message: 'No pin number for pereson', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(pin_number:subject.pin_number)).to eq message
    end

end
