module ItemInterfaceTest
  def test_implements_to_s
    assert_respond_to(@item, :to_s)
  end

  def test_implements_increase_statistics
    assert_respond_to(@item_class, :increse_statistic)
  end
end
