require_relative './statement_printer'

class Account
  attr_reader :balance, :statement, :statement_printer

  def initialize(statement_printer = StatementPrinter.new)
    @statement_printer = statement_printer
    @statement = []
    @balance = 0
  end

  def make_a_deposit(money)
    @balance += money
    @statement.push("#{Time.now.strftime('%x')}|| #{money}|| ||#{@balance}")
  end

  def make_a_withdrawal(money)
    raise 'Insufficient funds' if money > @balance
    @balance -= money
    @statement.push("#{Time.now.strftime('%x')}|| || #{money}||#{@balance}")
  end

  def print
    @statement_printer.print_header
    @statement_printer.print_transaction_history(statement)
  end
end
