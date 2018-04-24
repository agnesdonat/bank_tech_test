class Account
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def make_a_deposit(money)
    @balance += money
  end

  def make_a_withdrawal(money)
    @balance -= money
  end
end
