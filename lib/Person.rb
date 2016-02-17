class Person
  attr_accessor :name, :pin_number, :cash
  def initialize(options = {})
      @name = options[:name]
      @pin_number = options[:pin_number]
      @cash = options[:ammount_cash]
  end

  def checkstatus(options = {})
      if options[:name]
        message = { status: false, message: 'No name for pereson', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:cash]
        message = { status: false, message: 'Negative amount for cash', date: Date.today.strftime('%Y-%m-%d')}
      elsif options[:pin_number]
        message = { status: false, message: 'No pin number for pereson', date: Date.today.strftime('%Y-%m-%d')}
      end
  end

end
