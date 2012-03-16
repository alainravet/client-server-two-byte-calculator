require_relative '../calculator'

require 'minitest/spec'
require 'minitest/autorun'

# for Rubymine (optional)
require 'minitest/reporters'
MiniTest::Unit.runner = MiniTest::SuiteRunner.new
MiniTest::Unit.runner.reporters << MiniTest::Reporters::RubyMineReporter.new
