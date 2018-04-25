require 'statement_printer'

describe StatementPrinter do
  it { is_expected.to respond_to(:print_header) }

  describe '#print_header' do
    it 'prints header for bank statement' do
      expect {subject.print_header }
        .to output("date||credit||debit||balance\n").to_stdout
    end

  end
end
