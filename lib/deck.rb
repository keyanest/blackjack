require_relative "card"
require 'pry'

class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  def initialize
    @card = build_deck
  end

  def build_deck
    @card_array = []
      SUITS.each do |suit|
        VALUE.each do |value|
          @card_array << Card.new(suit, value)
        end
      end
      @card_array.shuffle!
  end

  def deal_card(num)
    @card_array.pop(num)
  end
end
