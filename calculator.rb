module Calculator

  OPERATORS = {
    'PLUS'   => :+,
    'MINUS'  => :-,
    'TIMES'  => :*,
    'DIVIDE' => :/
  }

  class << self
    def process_input(input)
      input
    end

    # input  : "PLUS 1 2 3"
    # output : ["PLUS", [1, 2, 3]]
    def op_and_arguments(command)
      els = command.split
      operator = OPERATORS.fetch(els.shift) # 'PLUS' => :+
      arguments = els.map(&:to_i)

      [operator, arguments]
    end

  end


end