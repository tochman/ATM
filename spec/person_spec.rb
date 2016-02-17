require './lib/Person.rb'

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
