require_relative '../characters/hero'
require_relative '../ui/string'
require_relative 'character_interface_test'
require 'test/unit'

class HeroTest < Test::Unit::TestCase
  include CharacterInterfaceTest

  def setup
    @hero = @character = Hero.new
  end

  def test_defeat_message
    assert_equal("The hero has lost the battle!\n".red, @hero.defeat_message)
  end

  def test_win_shout
    assert_equal('The hero won the battle with 100 health remaining!'.green, @hero.win_shout)
  end
end
