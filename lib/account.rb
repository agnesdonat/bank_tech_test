class Account
  attr_reader :balance, :credit

  def initialize
    @balance = 0
    @credit = 0
  end

  def make_a_deposit(money)
    @balance += money
    @credit = money
  end

  def make_a_withdrawal(money)
    raise "Insufficient funds" if money > @balance
    @balance -= money
  end
end
