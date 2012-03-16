module Calculator

  OPERATORS = {
    'PLUS'   => :+,
    'MINUS'  => :-,
    'TIMES'  => :*,
    'DIVIDE' => :/
  }

  class << self
    def process_input(text)
      "RESULT #{calculate(text)}"
    end

    def calculate(text)
      op, args = op_and_arguments(text)
      args.reduce(op)
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