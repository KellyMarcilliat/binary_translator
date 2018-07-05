require './lib/binary_translator'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class BinaryTranslatorTest < Minitest::Test

  def test_it_exists
    bt = BinaryTranslator.new

    assert_instance_of BinaryTranslator, bt
  end

  def test_it_translates
    bt = BinaryTranslator.new

    assert_equal "000001", bt.translate("a")
    assert_equal "011010", bt.translate("z")
    assert_equal "010100010101010010001001001110000111", bt.translate("turing")
  end

  def test_it_translates_capitals
    bt = BinaryTranslator.new

    assert_equal "000001", bt.translate("a")
    assert_equal "000001", bt.translate("A")
    assert_equal "011010", bt.translate("z")
    assert_equal "011010", bt.translate("Z")
    assert_equal "010100010101010010001001001110000111", bt.translate("turing")
    assert_equal "010100010101010010001001001110000111", bt.translate("TURING")
  end

  def test_it_translates_non_letter_characters
    bt = BinaryTranslator.new

    assert_equal "000000", bt.translate(" ")
    assert_equal "", bt.translate("!@{$#%^&*()}")
    assert_equal "001000000101001100001100001111000000010111001111010010001100000100", bt.translate("Hello World!")
  end

end
