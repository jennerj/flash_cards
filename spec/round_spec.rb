require 'pry'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'


RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  it "exists" do
    expect(@round).to be_instance_of(Round)
  end

  it "has a deck" do
    expect(@round.deck).to be_instance_of(Deck)
  end

  it "starts with no turns" do
    expect(@round.turns).to be_instance_of(Array)
  end

  it "gets first card in deck" do
    expect(@round.current_card).to eq(@deck.cards[0])
  end

  

end
