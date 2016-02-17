class ATM
  attr_accessor :balance

  def initialize(options = {})
    @balance = options[:balance]
  end

  def withdraw(amount)
    case
    when not_divisible_by_five?(amount)
      message(status: false, message: 'Amount not divisible by 5')
    when insufficient_funds_in_atm?(amount)
      message(status: false, message: 'Insufficient funds')
    else
      message(status: true, message: 'Success', amount: amount)
    end
  end

  private

  def insufficient_funds_in_atm?(amount)
    @balance < amount
  end

  def not_divisible_by_five?(amount)
    amount % 5 != 0
  end

  def message(options = {})
    message = { status: options[:status], message: options[:message], date: Date.today.strftime('%Y-%m-%d') }
    message.merge!({amount: options[:amount]}) if options[:amount]
    message
  end
end
