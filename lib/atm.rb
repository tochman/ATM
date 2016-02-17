class ATM
  attr_accessor :balance

  def initialize(options = {})
    @balance = options[:balance]
  end

  def withdraw(amount)
    if @balance > amount
      { status: true, message: 'success', date: Date.today.strftime("%Y-%m-%d")}
    else
      { status: false, message:'Insufficient funds', date: Date.today.strftime("%Y-%m-%d")}
    end
  end
end
