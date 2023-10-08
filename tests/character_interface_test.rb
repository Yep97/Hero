module CharacterInterfaceTest
  def test_implements_to_s
    assert_respond_to(@character, :to_s)
  end

  def test_implements_statistics
    assert_respond_to(@character, :statistics)
  end

  def test_implements_died
    assert_respond_to(@character, :died?)
  end

  def test_implements_attack
    assert_respond_to(@character, :attack)
  end

  def test_implements_return_remaining_health
    assert_respond_to(@character, :return_remaining_health)
  end

  def test_implements_defeat_message
    assert_respond_to(@character, :defeat_message)
  end

  def test_implements_win_shout
    assert_respond_to(@character, :win_shout)
  end
end
