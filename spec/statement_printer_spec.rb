require 'statement_printer'

describe StatementPrinter do
  describe '#print_statement' do
    let(:account) { double(:account) }
    let(:subject) { StatementPrinter.new(account) }
    let(:transaction) { %w[transaction1 transaction2] }

    it 'prints transaction history in a reverse order with a header' do
      allow(account).to receive(:statement).and_return(transaction)
      expect { subject.print_statement }.to output {
        "date||credit||debit||balance\ntransaction2\ntransaction1"
      }.to_stdout
    end
  end
end
