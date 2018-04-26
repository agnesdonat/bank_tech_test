require_relative './account'

class StatementPrinter
  attr_reader :account

  def initialize(account = Account.new)
    @account = account
  end

  def print_statement
    puts 'date||credit||debit||balance'
    @account.statement.reverse.each do |transaction|
      puts transaction
    end
  end
end
