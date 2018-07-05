class BinaryTranslator
  def initialize
    @alpha_to_binary = {
      "a" => "000001",
      "b" => "000010",
      "c" => "000011",
      "d" => "000100",
      "e" => "000101",
      "f" => "000110",
      "g" => "000111",
      "h" => "001000",
      "i" => "001001",
      "j" => "001010",
      "k" => "001011",
      "l" => "001100",
      "m" => "001101",
      "n" => "001110",
      "o" => "001111",
      "p" => "010000",
      "q" => "010001",
      "r" => "010010",
      "s" => "010011",
      "t" => "010100",
      "u" => "010101",
      "v" => "010110",
      "w" => "010111",
      "x" => "011000",
      "y" => "011001",
      "z" => "011010"
    }
  end

  def translate(letter_string)
    letter_string.split(//).map! do |letter|
      if letter == " "
        "000000"
      elsif ("a".."z").include?(letter.downcase)
        @alpha_to_binary[letter.downcase]
      end
    end.join
  end

  def translate_to_text(binary_string)
    slice_into_binaries(binary_string).map! do |binary|
      if binary != "000000"
       @alpha_to_binary.invert[binary]
     else
       " "
     end
    end.join
  end

  def slice_into_binaries(binary_string)
    binaries = []
    while binary_string.length > 0 do
      binaries << binary_string.slice!(0..5)
    end
    return binaries
  end
end
