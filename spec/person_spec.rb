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


end
