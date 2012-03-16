require_relative 'test_helper'
describe String do

  describe ".to_2_byte_integer" do
    it "converts '1234' to a TwoByteInt" do
      '1234'.to_2_byte_integer.must_be_instance_of TwoByteInt
      '1234'.to_2_byte_integer.to_i.must_equal 1234
    end
  end
end


describe TwoByteInt do

  describe "#new" do
    it "cannot be negative" do
      lambda {TwoByteInt.new(-1)}.must_raise(TwoByteInt::ValueError)
    end
    it "cannot be > 65535" do
      lambda {TwoByteInt.new(65535+1)}.must_raise(TwoByteInt::ValueError)
    end
    it "cannot be a decimal" do
      lambda {TwoByteInt.new(1.1)}.must_raise(TwoByteInt::ValueError)
    end

    it "can be any int between 0 and 65535" do
      TwoByteInt.new(0    )
      TwoByteInt.new(65535)
    end
  end

  describe "the 4 operators" do
    it '+ adds' do
      (tbi(100) + tbi(200)).must_equal tbi(100+200)
      (tbi(100) + tbi(200)).must_be_instance_of TwoByteInt
    end
    it '+ raises a TwoByteInt::ValueError if the result is bigger than 65535' do
      lambda {tbi(65535) + tbi(1)}.must_raise(TwoByteInt::ValueError)
    end

    it '- substracts' do
      (tbi(100) - tbi(20)).must_equal tbi(100-20)
      (tbi(100) - tbi(20)).must_be_instance_of TwoByteInt
    end
    it '- raises a TwoByteInt::ValueError if the result is < 0' do
      lambda {tbi(0) - tbi(1)}.must_raise(TwoByteInt::ValueError)
    end

    it '/ divides' do
      (tbi(100) / tbi(20)).must_equal tbi(100/20)
      (tbi(100) / tbi(20)).must_be_instance_of TwoByteInt
    end
    it '/ raises a TwoByteInt::DivideByZeroError if the divident is 0' do
      lambda {tbi(100) / tbi(0)}.must_raise(TwoByteInt::DivideByZeroError)
    end


    it '* multiplies' do
      (tbi(100) * tbi(20)).must_equal tbi(100*20)
      (tbi(100) * tbi(20)).must_be_instance_of TwoByteInt
    end
    it '* raises a TwoByteInt::ValueError if the result is bigger than 65535' do
      lambda {tbi(65535) * tbi(2)}.must_raise(TwoByteInt::ValueError)
    end
  end

  it ".to_s works like in Fixnum" do
    tbi(1234).to_s.must_equal '1234'
  end
end