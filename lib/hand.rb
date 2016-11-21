require 'pry'

class Hand
  attr_accessor :hand


  def initialize
    @hand = []
    @score = 0
    @aces = 0
  end

  def put_in_hand(card)
    @hand << card
    @hand.flatten!
  end

  def calculate_score
    @score = 0
    @aces = 0
    @hand.each do |card|
      @score += card.value.to_i
      if card.is_face?
        @score += 10
      end
      if card.is_ace?
        @score += 11
        @aces += 1
      end
    end
    fix_ace_issue
  end


  def fix_ace_issue
    while @score > 21 && @aces > 0
      @score -= 10
      @aces -= 1
    end
    @score
  end



  # def display_hand
  #   # @hand.each do |cards|
  #     "#{@hand[0]}#{@hand[1]}"
  #   # end
  # end

end
