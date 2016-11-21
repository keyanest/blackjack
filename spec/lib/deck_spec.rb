require "spec_helper"
#
RSpec.describe Deck do

  let(:deck) { Deck.new }

  describe "#build_deck" do
    it "build a deck of 52 cards" do
      expect(deck.build_deck.size).to eq(52)
    end
  end

  describe "#deal_card" do
    it "gives out 2 cards when asked for 2 cards" do
      expect(deck.deal_card(2).size).to eq(2)
    end
    it "gives out 4 cards when asked for 4 cards" do
    expect(deck.deal_card(4).size).to eq(4)
    end
    it "does not give out 2 cards when asked for 3 cards" do
    expect(deck.deal_card(3).size).to_not eq(2)
    end
  end
#
end
