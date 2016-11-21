require_relative "deck"
require_relative "hand"
# require_relative 'betting'
require 'pry'

class Blackjack

  def initialize
    @player
    @computer
    @current_deck
    @hit_stay
    @yes_no
    # @betting = Betting.new
  end

  def start_game
    @current_deck = Deck.new
    @player = Hand.new
    @computer = Hand.new
    @player.put_in_hand(@current_deck.deal_card(2))
    @computer.put_in_hand(@current_deck.deal_card(2))
    puts "Player dealt: #{@player.hand[0].cards_are?}"
    puts "Player dealt: #{@player.hand[1].cards_are?}"
    puts "Player's score: #{@player.calculate_score}"
    puts "Dealer showing: #{@computer.hand[0].cards_are?}"
    blackjack_or_bust?
    puts "Do you want to hit or stay?(H/S)."
    hit_or_stay
  end

  def blackjack_or_bust?
    if @player.calculate_score > 21
      puts "You bust! Dealer wins!"
      puts "Do you want to play again?(Y/N)."
      end_game
    elsif @player.calculate_score == 21
      puts "Blackjack! You win!"
      puts "Do you want to play again?(Y/N)."
      end_game
    end
  end

  def hit_or_stay
    @hit_stay = gets.chomp.downcase
    valid_input_method
    until @hit_stay == 's' do
      @player.put_in_hand(@current_deck.deal_card(1))
      puts "Player dealt: #{@player.hand[-1].cards_are?}"
      puts "New score: #{@player.calculate_score}"
      blackjack_or_bust?
      puts "Do you want to hit or stay?(H/S)"
      @hit_stay = gets.chomp.downcase
      valid_input_method
    end
      dealer_turn
  end

  def valid_input_method
    until @hit_stay == 's' || @hit_stay == 'h' do
      puts "Please put either (H/S)."
      @hit_stay = gets.chomp.downcase
    end
  end

  def dealer_turn
    puts "Dealer has: #{@computer.hand[0].cards_are?}"
    puts "Dealer has: #{@computer.hand[1].cards_are?}"
    puts "Dealer's score: #{@computer.calculate_score}"
    while @computer.calculate_score < 17 do
      @computer.put_in_hand(@current_deck.deal_card(1))
      puts "Dealer dealt: #{@computer.hand[-1].cards_are?}"
      puts "Dealer's score: #{@computer.calculate_score}"
    end
    if @computer.calculate_score >= 21
      dealer_blackjack_or_bust?
    else
      winner_method
    end
  end

  def dealer_blackjack_or_bust?
    if @computer.calculate_score > 21
      puts "Dealer busts! Player wins :)!"
      puts "Do you want to play again?(Y/N)."
      end_game
    elsif @computer.calculate_score == 21
      puts "Dealer wins! Player loses! :("
      puts "Do you want to play again?(Y/N)."
      end_game
    end
  end

  def winner_method
    if @computer.calculate_score >= @player.calculate_score
      puts "Dealer has #{@computer.calculate_score}, Dealer wins! :("
      puts "Do you want to play again?(Y/N)."
      end_game
    else
      puts "Player has #{@player.calculate_score}, Player wins! :)"
      puts "Do you want to play again?(Y/N)."
      end_game
    end
  end

  def end_game
    @yes_no = gets.chomp.downcase
    new_game_valid_input
    if @yes_no == 'n'
      puts "Thanks, come again!"
      abort
    else
      start_game
    end
  end

  def new_game_valid_input
    until @yes_no == 'y' || @yes_no == 'n' do
      puts "Please say (Y/N)."
    end
  end

end
