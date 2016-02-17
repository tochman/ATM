class ATM
  attr_accessor :balance

  def initialize(options = {})
    @balance = options[:balance]
  end

  def withdraw(amount)
    if @balance > amount
      { status: true, message: 'success' }
    else
      { status: false }
    end
  end
end
