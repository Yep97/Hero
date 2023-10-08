require_relative '../shops/medic_shop'
require_relative '../items/item'
require_relative '../characters/hero'
require_relative '../items/potion'
require_relative 'shop_interface_test'
require 'test/unit'

class MedicShopTest < Test::Unit::TestCase
  include ShopInterfaceTest

  def setup
    @medic_class = @shop_class = MedicShop
  end

  def test_return_items
    assert_equal(3, @medic_class.return_items.count)
  end

  def test_item_class
    assert_equal(Potion, @medic_class.item_class)
  end

  def test_welcome_message
    assert_equal('Welcome to Medic Shop', @medic_class.welcome_message)
  end

  def test_banner_color
    assert_equal(:cyan, @medic_class.banner_color)
  end

  def test_banner_text
    assert_equal("\u{1F489} {{bold:Medic Shop}} \u{1F489}", @medic_class.banner_text)
  end

  def test_buy_item_true
    assert_equal(50, @medic_class.buy_item(hero: [Hero.new(health: 40, gold: 10)], item_name: 'Lesser healing potion'))
  end

  def test_buy_item_false
    assert_equal(false,
                 @medic_class.buy_item(hero: [Hero.new(health: 40, gold: 0)], item_name: 'Lesser healing potion'))
  end
end
