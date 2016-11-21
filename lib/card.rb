require 'pry'

class Card
  attr_reader :value, :suit

  def initialize(suit, value)
    @suit = suit
    @value = value
    is_face?
    is_ace?
  end

  def cards_are?
    "#{@suit}#{@value}"
  end

  def is_face?
    @value == 'J' || @value == 'Q' || @value == 'K'

  end

  def is_ace?
    @value == 'A'
  end

end
