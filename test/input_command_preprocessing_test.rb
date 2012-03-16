require_relative 'test_helper'

describe Calculator do
  describe "#op_and_arguments" do

    before do
      @operator, @arguments = Calculator.op_and_arguments('PLUS 1 2 3')
    end

    it 'extracts the arguments and convert them to numbers' do
      @arguments.must_equal [1,2,3]
    end

    it 'extracts the operator and convert it to a symbol' do
      Calculator.op_and_arguments('PLUS 1 2'  ).first.must_equal :+
      Calculator.op_and_arguments('MINUS 1 2' ).first.must_equal :-
      Calculator.op_and_arguments('TIMES 1 2' ).first.must_equal :*
      Calculator.op_and_arguments('DIVIDE 1 2').first.must_equal :/
    end

  end

end