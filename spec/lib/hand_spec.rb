require "spec_helper"

RSpec.describe Hand do

  let(:new_hand) { Hand.new }

  describe "#calculate_score" do
    it "returns 0 for an empty hand" do
      expect(new_hand.calculate_score).to eq(0)
    end

    describe "#calculate_score" do
      it "returns 10 for a Jack and Jack in the hand" do
        new_hand.hand << Card.new("♦", "J")
        new_hand.hand << Card.new("♥", "J")
        expect(new_hand.calculate_score).to eq(20)
      end

      it "returns 12 for an Ace and Ace in the hand" do
        new_hand.hand << Card.new("♦", "A")
        new_hand.hand << Card.new("♥", "A")
        expect(new_hand.calculate_score).to eq(12)
      end

      it "returns 12 for a King, Ace and Ace in the hand" do
        new_hand.hand << Card.new("♦", "A")
        new_hand.hand << Card.new("♥", "A")
        new_hand.hand << Card.new("♥", "K")
        expect(new_hand.calculate_score).to eq(12)
      end

    end
  end

end
