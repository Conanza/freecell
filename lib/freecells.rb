class FreecellAddError < RuntimeError
end

class Freecells
  attr_reader :freecells

  def initialize
    @freecells = Array.new(4) { Array.new }
  end

  def [](pile)
    @freecells[pile]
  end

  def []=(pile, card)
    @freecells[pile] = card
  end

  def add_cards(pile, card)
    raise FreecellAddError unless self[pile].empty?
    raise FreecellAddError if card.length > 1

    self[pile] += card
  end
end