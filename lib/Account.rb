class Account
  attr_accessor :balance, :pin_number, :account_number, :expire_date, :card_status
  def initialize(options = {})
      @balance = options[:balance]
      @pin_number = options[:pin_number]
      @expire_date = options[:expir_date]
      @card_status = options[:card_status]
      @account_number= options[:account_number]
  end

  def checkstatus(options = {})
      if options[:balance]
        message = { status: false, message: 'Nigative ammount for balance for account', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:pin_number]
        message = { status: false, message: 'No pin number for account', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:account_number]
      message = { status: false, message: 'No account number for account', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:expire_date]
        expired_account(expire_date:Date.today.strftime('%Y-%m-%d'))

    end
  end

  private
  def expired_account?(options = {})
    if expire_date <Date.today.strftime('%Y-%m-%d')
      message = { status: false, message: options.to_s, date: Date.today.strftime('%Y-%m-%d')}
    end
  end
end
