class ATM
  attr_accessor :balance

  def initialize(options = {})
    @balance = options[:balance]
  end

  def withdraw(account_object, entered_pin_number, amount)
    case
      when not_divisible_by_five?(amount)
        message(status: false, message: 'Amount not divisible by 5')
      when insufficient_funds_in_account?(account_object,amount)
        message(status: false, message: 'Insufficient funds')
      when is_entred_pin_number_invalid?(account_object, entered_pin_number)
        message(status: false, message: 'Error. Invalid pin number', amount: amount)
      else
        account_object.balance=account_object.balance - amount
        message(status: true, message: 'Success', balance: account_object.balance - amount)
    end
  end

  private

  def insufficient_funds_in_account?(account_object,amount)
    account_object.balance < amount
  end

  def not_divisible_by_five?(amount)
    amount % 5 != 0
  end

  def is_entred_pin_number_invalid?(account, pin)
    account.pin_number != pin
  end

  def message(options = {})
   message = {status: options[:status], message: options[:message]}
   if options[:amount]
     message.merge!({amount: options[:amount]})
   elsif options[:balance]
     message.merge!({balance: options[:balance]})
   elsif options[:card_status]
     message.merge!({card_status: options[:card_status]})
   else
     message
  end
end

end
