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
    @new_turn = Turn.new("Juneau", @card_1)
  end

  it "has a deck" do
    expect(@round.deck).to be_instance_of(Deck)
  end

  it "starts with no turns" do
    expect(@round.turns).to eq([])
  end

  it "gets first card in deck" do
    expect(@round.current_card).to eq(@card_1)
  end

  it "takes a turn, and prepares a new turn" do
    expect(@new_turn).to be_a(Turn)

    new_turn = @round.take_turn("Juneau")
    expect(@new_turn.correct?).to be(true)
    expect(@round.turns).to eq([new_turn])
    expect(@round.number_correct).to eq(1)
    expect(@round.current_card).to eq(@card_2)

    @round.take_turn("Venus")
    expect(@round.turns.count).to eq(2)
    expect(@round.turns.last.feedback).to eq('Incorrect.')
    expect(@round.number_correct).to eq(1)
  end

  it "sorts correct responses by category" do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")

    expect(@round.percent_correct).to eq(50.0)
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
  end


end
