require_relative '../shops/weapons_shop'
require_relative '../items/item'
require_relative '../characters/hero'
require_relative '../items/weapon'
require_relative 'shop_interface_test'
require 'test/unit'

class WeaponsShopTest < Test::Unit::TestCase
  include ShopInterfaceTest

  def setup
    @weapons_class = @shop_class = WeaponsShop
  end

  def test_return_items
    assert_equal(2, @weapons_class.return_items.count)
  end

  def test_item_class
    assert_equal(Weapon, @weapons_class.item_class)
  end

  def test_welcome_message
    assert_equal('Welcome to Weapons Shop', @weapons_class.welcome_message)
  end

  def test_banner_color
    assert_equal(:blue, @weapons_class.banner_color)
  end

  def test_banner_text
    assert_equal("\u{1F528} {{bold:Weapons Shop}} \u{1F528}", @weapons_class.banner_text)
  end

  def test_buy_item_true
    assert_equal([5, 10], @weapons_class.buy_item(hero: [Hero.new(damage_range: [1, 2], gold: 60)], item_name: 'Club'))
  end

  def test_buy_item_false
    assert_equal(false, @weapons_class.buy_item(hero: [Hero.new(damage_range: [1, 2], gold: 0)], item_name: 'Club'))
  end
end
