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

class PERSON
  attr_accessor :name, :address, :pin_number, :expir_date, :card_status, :ammount_cash
  def initialize(person_id, name, address, pin_number, expir_date, card_status, ammount_cash)
      @person_id = person_id
      @name = name
      @address = address
      @pin_number = pin_number
      @expir_date = expir_date
      @card_status = card_status
      @ammount_cash = ammount_cash
  end

    def checkstatus()
      if @expir_date < Date.today
        message = { status: false, message: 'Expired card', date: Date.today.strftime('%Y-%m-%d')}
      end
    end
end

class ACCOUNT
  attr_accessor :ammount
  def initialize(account_id, person_id, amount, pin_number)
      @account_id = account_id
      @person_id =person_id
      @amount = ammount
      @pin_number = pin_number
    end
end
