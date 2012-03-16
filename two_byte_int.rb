# This class holds 2-byte integer value and supports the 4 operators (+,-,*,/)

class TwoByteInt
  class Error             < RuntimeError     ; end
  class ValueError        < TwoByteInt::Error; end
  class DivideByZeroError < TwoByteInt::Error; end
end


class TwoByteInt

  def initialize(_int_value)
    @_int_value = _int_value.to_i
    check_value_is_a_2_byte_integer(_int_value)
  end

  def to_i
    @_int_value
  end

  def to_s
    @_int_value.to_s
  end

  def ==(other)
    self._int_value == other._int_value
  end

  def +(other) TwoByteInt.new(self.to_i + other.to_i) end
  def -(other) TwoByteInt.new(self.to_i - other.to_i) end
  def *(other) TwoByteInt.new(self.to_i * other.to_i) end
  def /(other)
    TwoByteInt.new(self.to_i / other.to_i)
  rescue ZeroDivisionError
    raise DivideByZeroError.new
  end


protected
  def _int_value
    @_int_value
  end


private
  def check_value_is_a_2_byte_integer(_int_value)
    raise ValueError.new("a TwoByteInt cannot be negative") if @_int_value < 0
    raise ValueError.new("a TwoByteInt cannot be bigger than 65535)") if            65535 < @_int_value
    raise ValueError.new("a TwoByteInt must be an integer)") if @_int_value != _int_value
  end

end





module ToTwoByteIntAble
  # similar to .to_i, but converts to a TwoByteInt
  def to_2_byte_integer
    TwoByteInt.new(self.to_i)
  end
end

String.send :include, ToTwoByteIntAble
Fixnum.send :include, ToTwoByteIntAble
