class FoundationAddError < RuntimeError
end

class Foundations
  def initialize
    @foundations = Array.new(4) { Array.new }
  end

  def [](pile)
    @foundations[pile]
  end

  def []=(pile, card)
    @foundations[pile] = card
  end

  def add_cards(pile, card)
    if self[pile].empty?
      raise FoundationAddError unless card.first.value == :ace

      self[pile] += card
    else
      pile_card_suit = @foundations[pile].last.suit
      pile_card_rank = @foundations[pile].last.rank
      incoming_card_suit = card.first.suit
      incoming_card_rank = card.first.rank

      raise FoundationAddError if
        pile_card_suit != incoming_card_suit ||
        (incoming_card_rank - pile_card_rank) != 1

      self[pile] += card      
    end

  end
end