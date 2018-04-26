# frozen_string_literal: true

require 'account'

describe Account do
  describe '#make_a_deposit' do
    it 'increases the balance by the deposit made' do
      expect { subject.make_a_deposit(1) }.to change { subject.balance }.by(1)
    end

    it 'adds transaction to statement' do
      expect(subject.make_a_deposit(1))
        .to eq ["#{Time.now.strftime('%x')}|| 1|| ||1"]
    end
  end

  describe '#make_a_withdrawal' do
    before(:each) { subject.make_a_deposit(1) }
    it 'throws an error message if balance < withdrawal' do
      expect { subject.make_a_withdrawal(2) }
        .to raise_error 'Insufficient funds'
    end

    it 'deduces money' do
      expect { subject.make_a_withdrawal(1) }
        .to change { subject.balance }.by(-1)
    end

    it 'adds transaction to statement' do
      expect(subject.make_a_withdrawal(1))
        .to eq ["#{Time.now.strftime('%x')}|| 1|| ||1",
                "#{Time.now.strftime('%x')}|| || 1||0"]
    end
  end
end
