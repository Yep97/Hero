require_relative 'item_interface_test'
require_relative '../items/item'
require 'test/unit'

class ItemTest < Test::Unit::TestCase
  include ItemInterfaceTest

  def setup
    @item = Item.new
    @item_class = Item
  end

  def test_increse_statistic
    assert_raise NotImplementedError do
      Item.increse_statistic
    end
  end

  def test_to_s
    assert_equal('Item', @item.to_s)
  end
end
