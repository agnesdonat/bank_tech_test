require 'statement_printer'

describe StatementPrinter do
  it { is_expected.to respond_to(:print_header) }

  describe '#print_header' do
    it 'prints header for bank statement' do
      expect { subject.print_header }
        .to output("date||credit||debit||balance\n").to_stdout
    end
  end

  describe '#print_transaction_history' do
    let(:transaction) { [double(:transaction1), double(:transaction2)] }

    it 'prints transaction history in a reverse order' do
      statement = ['transaction1', 'transaction2']
      expect(subject.print_transaction_history(statement))
        .to eq(['transaction2', 'transaction1'])
    end
  end
end
