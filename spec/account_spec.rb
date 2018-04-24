require 'account'

describe Account do

  it 'has balance of zero' do
    expect(subject.balance).to eq 0
  end

  it 'stores the last credit' do
    expect(subject.credit).to eq 0
  end

  it 'stores the last withdrawal' do
    expect(subject.debit).to eq 0
  end

  describe '#make_a_deposit' do
    it { is_expected.to respond_to(:make_a_deposit).with(1).argument }

    it 'stores deposit under credit' do
      expect { subject.make_a_deposit 1 }.to change { subject.credit }.by 1
    end

    it 'increases the balance by the deposit made' do
      expect { subject.make_a_deposit 1 }.to change { subject.balance }.by 1
    end
  end

  describe '#make_a_withdrawal' do
    it { is_expected.to respond_to(:make_a_withdrawal).with(1).argument }

    it 'throws an error message if balance < withdrawal' do
      subject.make_a_deposit(1)
      expect { subject.make_a_withdrawal 2 }.to raise_error 'Insufficient funds'
    end

    it 'stores withdrawal under debit' do
      subject.make_a_deposit(1)
      expect { subject.make_a_withdrawal 1 }.to change { subject.debit }.by 1
    end

    it 'deduces money' do
      subject.make_a_deposit(1)
      expect { subject.make_a_withdrawal 1 }.to change { subject.balance }.by(-1)
    end
  end
end
