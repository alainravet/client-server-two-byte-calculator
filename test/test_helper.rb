require_relative '../lib/calculator'

require 'minitest/spec'
require 'minitest/autorun'

# for Rubymine (optional)
require 'minitest/reporters'
MiniTest::Unit.runner = MiniTest::SuiteRunner.new
MiniTest::Unit.runner.reporters << MiniTest::Reporters::RubyMineReporter.new

def tbi(_int_value)
  TwoByteInt.new(_int_value)
end
