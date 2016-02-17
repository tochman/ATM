class Account
  attr_accessor :balance, :pin_number
  def initialize(options = {})
      @balance = options[:balance]
      @pin_number = options[:pin_number]
  end

  def checkstatus(options = {})
      if options[:balance]
        message = { status: false, message: 'Nigative ammount for balance for account', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:pin_number]
        message = { status: false, message: 'No pin number for account', date: Date.today.strftime('%Y-%m-%d')}
      end
  end
end
