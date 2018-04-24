class Account
  attr_reader :balance, :statement

  def initialize
    @statement = []
    @balance = 0
  end

  def make_a_deposit(money)
    @balance += money
  end

  def make_a_withdrawal(money)
    raise 'Insufficient funds' if money > @balance
    @balance -= money
  end
end
