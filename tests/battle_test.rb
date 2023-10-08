require_relative '../ui/string'
require_relative '../characters/Hero'
require_relative '../battle/Battle'
require_relative '../battle/Battle_Turn'
require 'test/unit'

class BattleTest < Test::Unit::TestCase
  def setup
    @battle = Battle.new
  end

  def test_implements_do_battle
    assert_respond_to(@battle, :do_battle)
  end

  def test_implements_print_starting_message
    assert_respond_to(@battle, :print_starting_message)
  end

  def test_implements_sum_possible_loot
    assert_respond_to(@battle, :sum_possible_loot)
  end

  def test_implements_set_loot
    assert_respond_to(@battle, :set_loot)
  end

  def test_implements_return_battle_types
    assert_respond_to(Battle, :return_battle_types)
  end

  def test_print_starting_message_one_monster
    message = @battle.print_starting_message(attackers: [*Hero.new], opponents: [*Monster.new])
    assert_equal("The #{'Hero'.green} is fighting enemy #{'Monster'.monster_name_text}\n", message)
  end

  def test_print_starting_message_two_monster
    message = @battle.print_starting_message(attackers: [*Hero.new], opponents: [Monster.new, Monster.new])
    assert_equal(
      "The #{'Hero'.green} is fighting enemies:\n#{'Monster'.monster_name_text}\n#{'Monster'.monster_name_text}\n", message
    )
  end

  def test_hero_won
    battle_result = @battle.do_battle(hero: [*Hero.new(max_health: 1000)])
    assert_equal('Hero won', battle_result)
  end

  def test_monsters_won
    battle_result = @battle.do_battle(hero: [*Hero.new(max_health: 1)])
    assert_equal('Monsters won', battle_result)
  end

  def test_return_battle_types
    assert_equal(%w[easy medium hard], Battle.return_battle_types)
  end

  def test_set_loot
    assert_equal(10, @battle.set_loot(attackers: [Hero.new(gold: 0)], loot: 10))
  end

  def test_sum_possible_loot
    assert_equal(98, @battle.sum_possible_loot(victims: [Monster.new, Monster.new]))
  end
end
