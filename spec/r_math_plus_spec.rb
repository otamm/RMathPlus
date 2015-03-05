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

    #it "returns true when a big prime number is passed as param" do
    #  expect(RMathPlus.is_prime?(104729)).to == true
    #end

  end

end
