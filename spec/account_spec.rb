require 'account'

describe Account do

  describe "#make_a_deposit" do
    it "is a method of Account class" do
      expect(subject).to respond_to(:make_a_deposit).with(1).argument
    end
  end

end
