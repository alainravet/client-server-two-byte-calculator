require_relative 'test_helper'

describe Calculator do
  describe "#process_input" do

# HAPPY PATH

    it "prefixes the result with 'RESULT '" do
      total = 1+2+3+4
      Calculator.process_input('PLUS 1 2 3 4').must_equal "RESULT #{total}"
    end

  end

end