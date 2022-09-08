# PROPOSITION ONE

# def roman_to_int(s)
#   #     if I is followed by a value that is not I then value minus I
#       roman_numbers = {
#           "I": 1,
#           "V": 5,
#           "X": 10,
#           "L": 50,
#           "C": 100,
#           "D": 500,
#           "M": 1000,
#       }
#       numbers = []
#       s.chars.to_a.each { |letter| numbers << roman_numbers[:"#{letter}"] }
#       results = 0
#       numbers.each_with_index do |n, i|
#           if numbers[i + 1].nil?
#               results += n
#           elsif n < numbers[i + 1]
#               results -= n
#           else
#               results += n
#           end

#       end
#       return results
#   end

# PROPOSITION TWO

# def roman_to_int(s)
#   #     if I is followed by a value that is not I then value minus I
#       numbers = []


#       s.chars.to_a.each do |letter|
#         case letter
#         when "I"
#           numbers << 1
#         when "V"
#           numbers << 5
#         when "X"
#           numbers << 10
#         when "L"
#           numbers << 50
#         when "C"
#           numbers << 100
#         when "D"
#           numbers << 500
#         when "M"
#           numbers << 1000
#         end
#       end

#       results = 0
#       numbers.each_with_index do |n, i|
#           if numbers[i + 1].nil?
#               results += n
#           elsif n < numbers[i + 1]
#               results -= n
#           else
#               results += n
#           end

#       end
#       return results
#   end

# PROPOSITION THREE

def roman_to_int(s)
  #     if I is followed by a value that is not I then value minus I
    numbers = []
      s.chars.to_a.map! do |letter|
        case letter
        when "I"
          numbers << 1
        when "V"
          numbers << 5
        when "X"
          numbers << 10
        when "L"
          numbers << 50
        when "C"
          numbers << 100
        when "D"
          numbers << 500
        when "M"
          numbers << 1000
        end
      end

      result = 0
      numbers.each_with_index do |n, i|
        result -= (numbers[i - 1] * 2) if  numbers[i - 1] < n && i != 0
        result += n
      end
      return result
  end
