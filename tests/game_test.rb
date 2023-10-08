require_relative '../game'
require_relative '../characters/hero'
require_relative '../characters/monster'

require 'test/unit'

class GameTest < Test::Unit::TestCase
  def setup
    @game = Game.new(hero: Hero.new)
  end

  def test_implements_start_game
    assert_respond_to(@game, :start_game)
  end
end
