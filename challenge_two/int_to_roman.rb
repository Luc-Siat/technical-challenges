def int_to_roman(num)

  # spltting numbers
  numbers =  num.digits
  result = []

  # creating an array with series of the letters
  numbers.each_with_index do |n, i|
  roman_letters_round = %w[I X C M]
      result << roman_letters_round[i] * n
  end

  # sorting the letters to match the typical IV XC display
  result.map! do |letters|
      roman_letters = %w[I V X L C D M]
      letter = letters.chars.sample
      roman_i = roman_letters.index(letter)
      case letters.length
      when  9
          roman_letters[roman_i] + roman_letters[roman_i + 2]
      when 5, 6, 7, 8
          length = letters.length - 5
          roman_letters[roman_i + 1] + letter * length
      when  4
          roman_letters[roman_i] + roman_letters[roman_i + 1]
      else
          letters
      end
  end
  result.reverse.join
end


print int_to_roman(359)
