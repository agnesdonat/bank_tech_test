require_relative './account'

class StatementPrinter
  def print_header
    puts 'date||credit||debit||balance'
  end

  def print_transaction_history(statement)
    statement.reverse.each do |transaction|
      puts transaction
    end
  end
end
