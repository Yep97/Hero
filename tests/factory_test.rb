require_relative '../factories/factory'
require 'test/unit'

class FactoryTest < Test::Unit::TestCase
  def test_implements_create_name
    assert_respond_to(Factory, :create_name)
  end

  def test_name_length
    word = Factory.create_name(RandomNameGenerator::GOBLIN)
    word.downcase!
    word.sub!(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
    word.sub!(/^y/, '')
    number_of_syllabs = word.scan(/[aeiouy]{1,2}/).size
    is_name_length_acceptable = (number_of_syllabs <= 6 && number_of_syllabs >= 2)
    assert_equal(true, is_name_length_acceptable)
  end
end
