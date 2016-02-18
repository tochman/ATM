class Account
  attr_accessor :balance, :card_status
  attr_reader :owner, :pin_number, :account_number, :expire_date
  STANDARD_VALIDITY_YRS = 1

  def initialize(owner, options = {})
    @owner = owner
    @balance = options[:balance]
    @pin_number = generate_pin_number
    @expire_date = set_expire_date
    @card_status = :valid
    @account_number = generate_an_account_number
  end
  #
  # def checkstatus(options = {})
  #   if options[:balance]
  #     message = {status: false, message: 'Nigative ammount for balance for account', date: Date.today.strftime('%Y-%m-%d')}
  #   elsif options[:pin_number]
  #     message = {status: false, message: 'No pin number for account', date: Date.today.strftime('%Y-%m-%d')}
  #   elsif options[:account_number]
  #     message = {status: false, message: 'No account number for account', date: Date.today.strftime('%Y-%m-%d')}
  #     # elsif options[:expire_date]
  #     #   expired_account()
  #
  #   end
  # end
  #
  private

<<<<<<< HEAD
  def checkstatus(options = {})
      if options[:balance]
        message = { status: false, message: 'Nigative ammount for balance for account', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:pin_number]
        message = { status: false, message: 'No pin number for account', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:account_number]
      message = { status: false, message: 'No account number for account', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:expire_date]
        expired_account(expire_date:Date.today.strftime('%Y-%m-%d'))
=======
  def generate_an_account_number
    rand(1_000_000..9_999_999)
  end
>>>>>>> edca3745c4183e0fe44801066bfcdd2bfea14fe4

  def generate_pin_number
    rand(1000..9999)
  end

<<<<<<< HEAD
  private
  def expired_account?(options = {})
    if expire_date <Date.today.strftime('%Y-%m-%d')
      message = { status: false, message: options.to_s, date: Date.today.strftime('%Y-%m-%d')}
    end
  end
=======
  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end


>>>>>>> edca3745c4183e0fe44801066bfcdd2bfea14fe4
end
