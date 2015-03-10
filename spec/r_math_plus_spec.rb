require 'spec_helper'


describe RMathPlus do

  describe ".is_prime?" do

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

  describe ".prime_array" do

    it "returns an array with all the primes lesser than or equal to its parameter" do
      expect(RMathPlus.prime_array(7)).to eq [2,3,5,7]
    end

    it "returns an empty array if input < 2" do
      expect(RMathPlus.prime_array(0)).to eq []
    end

  end

  describe ".nth_prime" do

    it "returns an array with the first n primes" do
      expect(RMathPlus.nth_prime(3)).to eq [2,3,5]
    end

    it "returns first prime if n == 1" do
      expect(RMathPlus.nth_prime(1)).to eq [2]
    end

    it "returns the primes in correct order" do
      expect(RMathPlus.nth_prime(100)[-1]).to eq 541
    end
  end

  describe ".prime_factors" do

    it "returns repeated prime factors of a given number" do
      expect(RMathPlus.prime_factors(8)).to eq [2,2,2]
    end

    it "returns its input if the input is a prime" do
      expect(RMathPlus.prime_factors(11)).to eq [11]
    end

  end

  describe ".lcm" do

    it "returns the least common multiple of an array of numbers" do
      expect(RMathPlus.lcm([2,4,8])).to eq 8
    end

    it "returns the least common multiple of a big array of numbers" do
      odds = []
      for i in (1..99)
        odds.push(i) if (i % 2) == 1
      end

      expect(RMathPlus.lcm(odds)).to eq 1089380862964257455695840764614254743075
    end

  end

end
