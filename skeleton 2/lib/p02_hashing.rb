class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    h = 0
    self.each_with_index do |ele,idx|
      h = (ele*idx ^ h)
    end
    h.to_i
  end
end

class String 
  def hash
    upper_alphabet = ("A".."Z").to_a
    lower_alphabet = ("a".."z").to_a
    alphabet = upper_alphabet + lower_alphabet
    alpha_idx = []
    self.each_char { |char| alpha_idx << alphabet.index(char) }
    alpha_idx.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alphabet = ("a".."z").to_a
    # self.each do |key,value|
    # end
    new_arr = []
    self.values.each do |ele|
      new_arr << ele
    end
    p new_arr
    new_arr.hash
  end

end
