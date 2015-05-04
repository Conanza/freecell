require_relative 'card'

class Deck
  def self.all_cards
    Card.suits.product(Card.values).map do |(suit, value)|
      Card.new(suit, value)
    end.shuffle
  end

  attr_accessor :cards

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def take_cards(n)
    @cards.shift(n)
  end
end