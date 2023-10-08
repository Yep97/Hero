require_relative '../characters/monster'
require_relative '../ui/string'
require_relative 'character_interface_test'
require 'test/unit'

class MonsterTest < Test::Unit::TestCase
  include CharacterInterfaceTest

  def setup
    @monster = @character = Monster.new
  end

  def test_calculate_loot
    assert_equal(49, @monster.gold)
  end

  def test_win_shout
    assert_equal("Monster won with #{@monster.return_remaining_health}".red, @monster.win_shout)
  end

  def test_defeat_message
    assert_equal("The hero has defeated #{@monster.name}!".killed_monster_text, @monster.defeat_message)
  end
end
