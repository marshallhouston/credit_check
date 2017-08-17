
# Valid: 5541808923795240, 4024007136512380, 6011797668867828
# Invalid: 5541801923795240, 4024007106512380, 6011797668868728

card_number = "5541801923795240"

def split_reverse(card_number)
  card_number.to_s.split('').reverse
end

def double_odd_index(card_number)
  split_reverse(card_number).map.with_index do |element, index|
    if index.odd?
      element.to_i * 2
    else
      element.to_i
    end
  end
end

def add_digits_above_ten(card_number)
  double_odd_index(card_number).map do |num|
    if num > 9
      num - 9
    else
      num
    end
  end
end

def find_sums(card_number)
  add_digits_above_ten(card_number).inject(:+)
end

def card_validity_test(card_number)
  if find_sums(card_number) % 10 == 0
    puts "The card #{card_number} is VALID."
  else
    puts "The card #{card_number} is INVALID."
  end
end

card_validity_test(card_number)
