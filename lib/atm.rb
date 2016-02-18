class ATM
  attr_accessor :balance

  def initialize(options = {})
    @balance = options[:balance]
  end

  def withdraw(account_object, entered_pin_number, amount)
    case
      when not_divisible_by_five?(amount)
        message(message: 'Amount not divisible by 5')
      when is_account_suspended?(account_object)
        message(message: 'Card has been deactivated')
      when is_entred_pin_number_invalid?(account_object, entered_pin_number)
        message(message: 'Error. Invalid pin number')
      when insufficient_funds_in_account?(account_object, amount)
        message(message: 'Insufficient funds')
      else
        account_object.balance=account_object.balance - amount
        message(status: true, message: 'Success', amount: amount)
    end
  end

  private

  def insufficient_funds_in_account?(account_object, amount)
    account_object.balance < amount
  end

  def not_divisible_by_five?(amount)
    amount % 5 != 0
  end

  def is_entred_pin_number_invalid?(account, pin)
    account.pin_number != pin
  end

  def is_account_suspended?(account_object)
    account_object.card_status != :active
  end

  def message(options = {})
    status = options[:status] || false
    message = {status: status, message: options[:message], date: Date.today.strftime('%Y-%m-%d')}
    message.merge!({amount: options[:amount]}) if options[:amount]
    message
  end


end
