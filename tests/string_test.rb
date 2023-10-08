require_relative '../ui/string'
require 'test/unit'

class StringTest < Test::Unit::TestCase
  def test_implements_colorize
    assert_respond_to(String.new, :colorize)
  end

  def test_implements_red
    assert_respond_to(String.new, :red)
  end

  def test_implements_green
    assert_respond_to(String.new, :green)
  end

  def test_implements_monster_name_text
    assert_respond_to(String.new, :monster_name_text)
  end

  def test_implements_killed_monster_text
    assert_respond_to(String.new, :killed_monster_text)
  end

  def test_colorized
    assert_equal("\e[1mBlack\e[0m", 'Black'.colorize(1))
  end

  def test_red
    assert_equal("\e[31mRed\e[0m", 'Red'.red)
  end

  def test_green
    assert_equal("\e[32mGreen\e[0m", 'Green'.green)
  end

  def test_monster_name_text
    assert_equal("\u{1f47e} \e[31mMonster\e[0m \u{1f47e}", 'Monster'.monster_name_text)
  end

  def test_killed_monster_text
    assert_equal("\u{2620} Dead \u{2620}\n", 'Dead'.killed_monster_text)
  end
end
