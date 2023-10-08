module ShopInterfaceTest
  def test_implements_return_items
    assert_respond_to(@shop_class, :return_items)
  end

  def test_implements_item_class
    assert_respond_to(@shop_class, :item_class)
  end

  def test_implements_banner_text
    assert_respond_to(@shop_class, :banner_text)
  end

  def test_implements_banner_color
    assert_respond_to(@shop_class, :banner_color)
  end

  def test_implements_welcome_message
    assert_respond_to(@shop_class, :welcome_message)
  end

  def test_implements_buy_item
    assert_respond_to(@shop_class, :buy_item)
  end
end
