require_relative 'item_interface_test'
require_relative '../items/weapon'
require_relative '../characters/hero'
require 'test/unit'

class WeaponTest < Test::Unit::TestCase
  include ItemInterfaceTest

  def setup
    @waepon = @item = Weapon.new
    @waepon_class = @item_class = Weapon
  end

  def test_increase_statistic
    sword = Weapon.new(damage_range: [1, 5])
    assert_equal(Hero.new(damage_range: [2, 7]).statistics[2..3],
                 Weapon.increase_statistic(hero: [Hero.new(damage_range: [1, 2])], item: sword))
  end
end
