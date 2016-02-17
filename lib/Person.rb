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
