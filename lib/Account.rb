class Account
  attr_accessor :balance, :card_status
  attr_reader :owner, :pin_number, :account_number, :expire_date
  STANDARD_VALIDITY_YRS = 1

  def initialize(owner, options = {})
    @owner = owner
    @balance = options[:balance]
    @pin_number = generate_pin_number
    @expire_date = set_expire_date
    @card_status = :valid
    @account_number = generate_an_account_number
  end

  private

  def generate_an_account_number
    rand(1_000_000..9_999_999)
  end

  def generate_pin_number
    rand(1000..9999)
  end

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%d/%m/%Y')
  end


end
