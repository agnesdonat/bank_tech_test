class Account
  attr_reader :balance, :statement

  def initialize
    @statement = []
    @balance = 0
  end

  def make_a_deposit(money)
    @balance += money
    @statement.push("#{Time.now.strftime('%x')}||" + " #{money}||" + " ||" + " #{@balance}")
  end

  def make_a_withdrawal(money)
    raise 'Insufficient funds' if money > @balance
    @balance -= money
  end
end
