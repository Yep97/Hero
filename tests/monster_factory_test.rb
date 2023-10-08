require_relative '../factories/monster_factory'
require_relative '../characters/monster'
require 'test/unit'

class MonsterFactoryTest < Test::Unit::TestCase
  def test_implements_monster_type
    assert_respond_to(MonsterFactory, :monster_type)
  end

  def test_implements_create_more_monsters
    assert_respond_to(MonsterFactory, :create_more_monsters)
  end

  def test_monster_type
    assert_equal(Monster.new(max_health: 75).max_health,
                 MonsterFactory.monster_type(type_of_monster: 'easy').max_health)
  end

  def test_create_two_monsters
    number_of_monsters = MonsterFactory.create_more_monsters(number_of_monsters: 2).length
    assert_equal(2, number_of_monsters)
  end

  def test_create_one_monsters
    number_of_monsters = MonsterFactory.create_more_monsters.length
    assert_equal(1, number_of_monsters)
  end
end
