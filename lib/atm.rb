class ATM
  attr_accessor :balance

  def initialize(options = {})
    @balance = options[:balance]
  end

  def withdraw(account_object, entered_pin_number, amount)
    case
      when not_divisible_by_five?(amount)
        message(status: false, message: 'Amount not divisible by 5')
      when insufficient_funds_in_atm?(amount)
        message(status: false, message: 'Insufficient funds')
      when is_entred_pin_number_invalid?(account_object, entered_pin_number)
        message()
      when is_card_expired?(account_object)
        message()
      when is_cad_inactive?(account_object)
        message()
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
    message = {status: options[:status], message: options[:message], date: Date.today.strftime('%Y-%m-%d')}
    message.merge!({amount: options[:amount]}) if options[:amount]
    message
  end

  def is_entred_pin_number_invalid?(account, pin)
    account.pin_number != pin
  end


end
