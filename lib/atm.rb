class ATM
  attr_accessor :balance

  def initialize(options = {})
    @balance = options[:balance]
  end

  def withdraw(amount)
    case
    when not_divisible_by_five?(amount)
      message(false, 'Amount not divisible by 5')
    when insufficient_funds_in_atm?(amount)
      message(false, 'Insufficient funds')
    else
      message(true, 'Success')
    end
  end

  private

  def insufficient_funds_in_atm?(amount)
    @balance < amount
  end

  def not_divisible_by_five?(amount)
    amount % 5 != 0
  end

  def message(status, message)
    { status: status, message: message, date: Date.today.strftime('%Y-%m-%d') }
  end
end
