require_relative 'test_helper'

describe Calculator do
  describe "#process_input" do

# HAPPY PATH

    it "prefixes the result with 'RESULT '" do
      total = 1+2+3+4
      Calculator.process_input('PLUS 1 2 3 4').must_equal "RESULT #{total}"
    end

    it "returns 'ERROR' if there was division by zero" do

      Calculator.process_input('DIVIDE 2 0').must_equal "ERROR"
    end

  end

end