require File.dirname(__FILE__) + '/two_byte_int'
module Calculator

  OPERATORS_AS_SYMBOLS = {
    'PLUS'   => :+,
    'MINUS'  => :-,
    'TIMES'  => :*,
    'DIVIDE' => :/
  }

  class << self
    def process_input(text)
      "RESULT #{calculate(text)}"
    rescue
      'ERROR'
    end

    def calculate(text)
      op, args = op_and_arguments(text)
      args.reduce(op)       # [1,2,3].reduce(:+) <==> 1 + 2 + 3
    end

    # input  : "PLUS 1 2 3"
    # output : [:+, [1, 2, 3]]
    def op_and_arguments(command)
      els = command.split
      operator  = OPERATORS_AS_SYMBOLS.fetch(els.shift) # 'PLUS' => :+
      arguments = els.map(&:to_2_byte_integer)
      [operator, arguments]
    end

  end


end