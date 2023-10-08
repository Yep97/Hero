require_relative 'shop_interface_test'
require_relative '../shops/shop'
require_relative '../items/item'
require_relative '../characters/hero'
require 'test/unit'

class ShopTest < Test::Unit::TestCase
  include ShopInterfaceTest

  def setup
    @shop_class = Shop
  end

  def test_implements_buy
    assert_respond_to(@shop_class, :buy)
  end

  def test_implements_choose_item
    assert_respond_to(@shop_class, :choose_item)
  end

  def test_buy_item
    assert_raise NotImplementedError do
      @shop_class.buy_item(hero: Hero.new, item_name: 'nothing')
    end
  end

  def test_return_items
    assert_raise NotImplementedError do
      @shop_class.return_items
    end
  end

  def test_item_class
    assert_raise NotImplementedError do
      @shop_class.item_class
    end
  end

  def test_welcome_message
    assert_equal('Welcome to Shop', @shop_class.welcome_message)
  end

  def test_banner_color
    assert_equal(:green, @shop_class.banner_color)
  end

  def test_banner_text
    assert_equal("\u{1F528} {{bold:Shop}} \u{1F528}", @shop_class.banner_text)
  end

  def test_choose_item
    items = [Item.new(name: 'sword'), Item.new(name: 'potion')]
    assert_equal('sword', @shop_class.choose_item(items: items, name: 'sword').name)
  end

  def test_buy_true
    assert_equal(10, @shop_class.buy(hero: [Hero.new(gold: 20)], price: 10))
  end

  def test_buy_false
    assert_equal(false, @shop_class.buy(hero: [Hero.new(gold: 0)], price: 10))
  end
end
