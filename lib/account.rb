class Account
  attr_reader :balance, :credit, :debit

  def initialize
    @balance = 0
    @credit = 0
    @debit = 0
  end

  def make_a_deposit(money)
    @credit = money
    @balance += @credit
  end

  def make_a_withdrawal(money)
    raise "Insufficient funds" if money > @balance
    @debit = money
    @balance -= money
  end
end
