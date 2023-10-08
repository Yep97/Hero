require_relative 'item_interface_test'
require_relative '../items/potion'
require_relative '../characters/hero'
require 'test/unit'

class PotionTest < Test::Unit::TestCase
  include ItemInterfaceTest

  def setup
    @potion = @item = Potion.new
    @potion_class = @item_class = Potion
  end

  def test_increase_statistic
    lesser_potion = Potion.new(healing_value: 0.1)
    assert_equal(Hero.new(health: 50).health,
                 Potion.increase_statistic(hero: [Hero.new(health: 40)], item: lesser_potion))
  end
end
