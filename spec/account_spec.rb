require './lib/account.rb'

describe Account do
  subject do
    described_class.new(user, balance: 500)
  end

  let(:user) { double(:user, name: 'Thomas') }

  describe 'after creation' do
    it 'has a pin number of 4 digits' do
      binding.pry
      length = Math.log10(subject.pin_number).to_i + 1
      expect(length).to eq 4
      expect(subject.pin_number.class).to eq Fixnum
    end

    it 'has a account number' do
      length = Math.log10(subject.account_number).to_i + 1
      expect(length).to eq 7
      expect(subject.account_number.class).to eq Fixnum
    end

    it 'has a expiry date' do
      date = Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
      expect(subject.expire_date).to eq date
    end
<<<<<<< HEAD
    it 'Returns expired account' do
      subject.expire_date =(Date.today -1).strftime('%Y-%m-%d')
      message = {status: false, message: 'Expired account', date: Date.today.strftime('%Y-%m-%d')}
      expect(subject.checkstatus(expire_date:subject.expire_date)).to eq message
    end
=======

    it 'has a status of valid' do
      expect(subject.card_status).to eq :valid
    end

    it 'has a balance' do
      expect(subject.balance).to eq 500
    end
  end


>>>>>>> edca3745c4183e0fe44801066bfcdd2bfea14fe4
end
