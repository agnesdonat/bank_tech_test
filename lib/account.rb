class Account
  attr_reader :balance, :statement

  def initialize
    @statement = []
    @balance = 0
    @time = Time.now.strftime('%x')
  end

  def make_a_deposit(money)
    @statement.push("#{@time}|| #{money}|| ||#{@balance += money}")
  end

  def make_a_withdrawal(money)
    raise 'Insufficient funds' if money > @balance
    @statement.push("#{@time}|| || #{money}||#{@balance -= money}")
  end
end
