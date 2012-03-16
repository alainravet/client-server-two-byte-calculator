require File.dirname(__FILE__) + '/../lib/calculator'

require 'rubygems'
require 'minitest/spec'
require 'minitest/autorun'


# for Rubymine (optional)
if $0 =~ /RubyMine\.app/
  require 'minitest/reporters'
  MiniTest::Unit.runner = MiniTest::SuiteRunner.new
  MiniTest::Unit.runner.reporters << MiniTest::Reporters::RubyMineReporter.new
end

def tbi(_int_value)
  TwoByteInt.new(_int_value)
end
