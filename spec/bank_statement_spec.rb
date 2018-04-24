require 'bank_statement'

describe BankStatement do
  it 'has an opening_balance of zero' do
    expect(subject.balance).to eq 0
  end
end
