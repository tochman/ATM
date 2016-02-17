require './lib/Person.rb'

describe Person do
  subject do
    described_class.new(name:'Tarek', pin_number:10, cash:0)
  end
    it 'Returns no name message' do
      subject.name =''
      message = {status: false, message: 'No name for pereson', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(name:subject.name)).to eq message
    end
    it 'Negative amount for cash' do
      subject.cash= -1
      message = {status: false, message: 'Negative amount for cash', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(cash:subject.cash)).to eq message
    end
    it 'No pin number for pereson' do
      subject.pin_number= ''
      message = {status: false, message: 'No pin number for pereson', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(pin_number:subject.pin_number)).to eq message
    end

end
