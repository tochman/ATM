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


class Person
  attr_accessor :name, :address, :pin_number, :expir_date, :card_status, :ammount_cash
  def initialize(options = {})
      @name = options[:name]
      @address = options[:address]
      @pin_number = options[:pin_number]
      @expir_date = options[:expir_date]
      @card_status = options[:card_status]
      @ammount_cash = options[:ammount_cash]
  end

  def checkstatus(options = {})
      if options[:name]
        message = { status: false, message: 'No name for pereson', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:address]
        message = { status: false, message: 'No adderss for pereson', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:ammount_cash]
        message = { status: false, message: 'Negative amount for cash', date: Date.today.strftime('%Y-%m-%d')}
      end
  end

end
