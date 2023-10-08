require_relative '../characters/character'
require_relative 'character_interface_test'
require 'test/unit'

class CharacterTest < Test::Unit::TestCase
  include CharacterInterfaceTest

  def setup
    @character = Character.new
  end

  def test_to_s
    assert_equal('NPC', Character.new.to_s)
  end

  def test_statistics
    assert_equal(['NPC', 100, 1, 10, 0], Character.new.statistics)
  end

  def test_alive
    assert_equal(false, Character.new(health: 100).died?)
  end

  def test_dead
    assert_equal(true, Character.new(health: 0).died?)
  end

  def test_attack
    target = Character.new
    assert_operator(target.health, :>, Character.new.attack(target))
  end

  def test_return_health
    assert_equal('100 health remaining!', Character.new.return_remaining_health)
  end

  def test_defeat_message
    assert_raise NotImplementedError do
      @character.defeat_message
    end
  end

  def test_win_shout
    assert_raise NotImplementedError do
      @character.win_shout
    end
  end
end
