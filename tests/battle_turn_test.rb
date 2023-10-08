require_relative '../ui/string'
require_relative '../characters/Monster'
require_relative '../characters/Hero'
require_relative '../battle/Battle_Turn'
require 'test/unit'

class BattleTest < Test::Unit::TestCase
  def test_implements_do_battle
    assert_respond_to(BattleTurn, :do_turn)
  end

  def test_implements_print_starting_message
    assert_respond_to(BattleTurn, :perform_attack)
  end

  def test_do_turn_won
    assert_equal(true,
                 BattleTurn.do_turn(action_performers: [*Hero.new(damage_range: [999, 1000])],
                                    action_victims: [*Monster.new]))
  end

  def test_do_turn_nothing
    assert_equal(nil, BattleTurn.do_turn(action_performers: [*Hero.new], action_victims: [*Monster.new]))
  end

  def test_perform_attack
    victim = BattleTurn.perform_attack(attackers: [*Hero.new(damage_range: [100, 100])], victims: [*Monster.new])
    assert_equal(Monster.new(max_health: 0).health, victim.health)
  end
end
