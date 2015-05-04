require_relative 'card'

class Deck
  def self.all_cards
    cards = []
    Card.suits.product(Card.values).each do |(suit, value)|
      cards << Card.new(suit, value)
    end

    cards.shuffle
  end

  attr_accessor :cards

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  def take_cards(n)
    @cards.shift(n)
  end
end