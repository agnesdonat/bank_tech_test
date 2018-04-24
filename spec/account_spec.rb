require 'account'

describe Account do
  it 'has balance of zero' do
    expect(subject.balance).to eq 0
  end

  describe '#make_a_deposit' do
    it { is_expected.to respond_to(:make_a_deposit).with(1).argument }

    it 'increases the balance by the deposit made' do
      expect{subject.make_a_deposit(1)}.to change{ subject.balance }.by 1
    end
  end

  describe '#make_a_withdrawal' do
    it { is_expected.to respond_to(:make_a_withdrawal).with(1).argument }

    it 'deduces money' do
      subject.make_a_deposit(1)
      expect{subject.make_a_withdrawal(1)}.to change{ subject.balance }.by -1
    end
  end
end
