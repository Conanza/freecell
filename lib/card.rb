class Card
  SUITS = {
    :spades => "spades",
    :clubs => "clubs",
    :diamonds => "diamonds",
    :hearts => "hearts"
  }

  VALUES = {
    :ace => 1,
    :two => 2, 
    :three => 3, 
    :four => 4,
    :five => 5,
    :six => 6,
    :seven => 7, 
    :eight => 8,
    :nine => 9,
    :ten => 10,
    :jack => 11,
    :queen => 12,
    :king => 13
  }

  attr_reader :suit, :value, :color

  def initialize(suit, value)
    @suit, @value = suit, value
    @color = [:spades, :clubs].include?(@suit) ? :black : :red
  end

  def self.values
    VALUES.keys
  end

  def self.suits
    SUITS.keys
  end

  def rank
    VALUES[value]
  end
end