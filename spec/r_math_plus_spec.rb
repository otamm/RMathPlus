require 'spec_helper'


describe RMathPlus do

  describe "is_prime?" do
    #before do
    #  config.expect_with(:rspec) { |c| c.syntax = :should }
    #end

    it "returns true when a number is prime" do
      (RMathPlus.is_prime?(3)).should == true
    end

    it "returns false when a number is not prime" do
      (RMathPlus.is_prime?(4)).should == false
    end

    it "returns true when a big prime number is passed as param" do
      (RMathPlus.is_prime?(104729)).should == true
    end

    it "executes faster when an array is passed as second parameter" do
      begin1 = Time.now
        (RMathPlus.is_prime?(50,[2,3,5,7,11,13,17,19,23,29,31,37,41,43,47]))
      finish1 = Time.now

      begin2 = Time.now
        (RMathPlus.is_prime?(50))
      finish2 = Time.now
      ((finish1 - begin1) > (finish2 - begin2)).should == true
    end

  end

end
