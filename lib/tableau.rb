require_relative 'deck'

class TableauAddError < RuntimeError
end

class Tableau
  def self.setup
    new_deck = Deck.new
    new_tableau = Array.new(8)

    new_tableau.each_index do |i|
      if i.between?(0, 3)
        new_tableau[i] = new_deck.take_cards(7)
      else
        new_tableau[i] = new_deck.take_cards(6)
      end
    end

    new_tableau
  end

  attr_reader :piles

  def initialize
    @piles = Tableau.setup
  end

  def [](pile)
    @piles[pile]
  end

  def []=(pile, cards)
    @piles[pile] = cards
  end

  def add_cards(pile, cards)
    if self[pile].empty?
      self[pile] += cards
    else
      card_on_pile_color = self[pile].last.color
      card_on_pile_rank = self[pile].last.rank
      incoming_pile_top_color = cards.first.color
      incoming_pile_top_rank = cards.first.rank

      raise TableauAddError if 
        card_on_pile_color == incoming_pile_top_color ||
        (card_on_pile_rank - incoming_pile_top_rank) != 1

      self[pile] += cards
    end
  end
end