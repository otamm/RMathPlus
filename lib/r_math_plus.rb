require "r_math_plus/version"

module RMathPlus

  def self.is_prime?(n,prime_array=false) # number to be checked as first parameter, optional second parameter to be used with the 'prime_array' method.
      if n < 2
        return false
      elsif n == 2
        return true
      else
      if prime_array
          for i in (2..(n/2)+1) #it makes no sense to divide by numbers which would result in a result less than 2 (the smallest prime); the '+1' in the end is due to the default 'round down' in integer division in Ruby.
          prime_array.each { |prime| return false if (n % prime) == 0 }
        end
      else
        for i in (2..(n/2)+1)
          if (n % i) == 0
            return false
          end
        end
      end
    end
    return true
  end

  def self.prime_array(n) #returns an array with all primes less than number n.
    if n < 2
      return []
    else
      prime_array = []
      for i in (2..n)
        prime_array.push(i) if RMathPlus.is_prime?(i,prime_array) # the own prime_array built so far is passed as an argument in order to improve processing speed.
      end
    end
    return prime_array
  end

  def self.nth_prime(n) #returns an array with all primes less than number n.
    if n <= 1
      if n == 1
        return [2]
      end
      if n < 1
        raise "Wops, there's no 0th prime!"
      end
    end
    prime_array = [2]
    i = 2
    array_size = 1 # compares faster than running prime_array.size on each loop
    while true
      i += 1
      if RMathPlus.is_prime?(i,prime_array) # the own prime_array built so far is passed as an argument in order to improve processing speed.
        prime_array.push(i)
        array_size += 1
        break if array_size == n
      end
    end
    return prime_array
  end

  def self.prime_factors(number, biggest_number_prime_array=false) #returns the prime factors of a given number. if n is prime, returns n. second parameter to improve speed if method would be utilized in a range of numbers.
    factors = []
    if biggest_number_prime_array
      primes = biggest_number_prime_array
    else
      primes = RMathPlus.prime_array(number)
    end

    while true
      signal = factors.size #signalizes when to break the loop.
      primes.each do |prime|
        if (number % prime) == 0
          factors.push(prime)
          number = number / prime
          break
        end
      end
      if signal == factors.size
        factors.push(number)
        break
      end
    end
    factors = factors.sort
    return factors - [1] #...because 1 is not a prime.
  end

  def self.lcm(nums) #method that returns the least common multiple between a given array of numbers.
    nums = nums.uniq.sort
    primes = RMathPlus.prime_array(nums[-1]) #biggest number in the whole array.
    factorized_nums = [] #holds the prime factors for each value in nums array.
    nums.each { |n| factorized_nums.push(RMathPlus.prime_factors(n,primes)) }

    unique_lcm_factors = [] #individual prime factors of lcm
    lcm_factors = {} #prime factors of lcm
    for factors in factorized_nums
      for factor in factors.uniq
        if lcm_factors.include?(factor)
          lcm_factors[factor] = factors.count(factor) if factors.count(factor) > lcm_factors[factor]
        else
          lcm_factors[factor] = factors.count(factor)
        end
      end
    end

    lcm = 1
    lcm_factors.each { |factor,max_quantity| lcm *= factor ** max_quantity }
    return lcm
  end

end

odds = []
for i in (1..99)
  odds.push(i) if (i % 2) == 1
end

puts RMathPlus.lcm(odds)
