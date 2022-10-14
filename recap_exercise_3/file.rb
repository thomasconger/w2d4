require "byebug"
# More Problems!
# The following problems do not have specs and cover many different topics. You'll want to follow the prompt for each problem and make sure your implementation satisfies the behavior in the given examples. Create a .rb file to work in and test your code manually by running ruby <your-file-name>.rb!

# General Problems
# no_dupes?
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

def no_dupes?(arr)

    # input (including duplicates)
    # iterate through array, indicating the count of each element
    # return a list of elements from arr that were not repeated
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    hash.select {|k,v| v < 2}.keys
end

# # Examples
# pp no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# pp no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# pp no_dupes?([true, true, true])            # => []


# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return true if an element never appears consecutively in the array; it should return false otherwise.

def no_consecutive_repeats?(arr)

    arr.each_with_index.inject(true) do |acc, (ele,idx)|
        if ele == arr[idx+1]
            return false
        else
            true
        end
    end

    #iterate through array, comparing each element to next
        #if identical, return false
        #otherwise do nothing
    #return true if no elements hold consecutive values

end

# # Examples
# puts no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# puts no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# puts no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# puts no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# puts no_consecutive_repeats?(['x'])                              # => true


 # char_indices
# Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys. The value associated with each key should be an array containing the indices where that character is found.

# # Examples
# char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
# longest_streak
# Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest streak of consecutive characters in the string. If there are any ties, return the streak that occurs later in the string.

def longest_streak(str)
    str = str.split("")
    streaks = []

    return str if str.length == 1

    #iterate through str by char
    #assuming not last char
    #if char == next char, add to current streak
    #return longest element of streaks

    while str.length > 0
        streak = str.shift
        while streak[0] == str[0]
            streak << str.shift
        end
        streaks << streak
    end

    hash = Hash.new(0)
    streaks.each do |ele|
        hash[ele] = ele.length
    end

    hash.sort_by {|k,v| v}.to_h.keys[-1].to_s
end

# # # Examples
#  puts longest_streak('a')           # => 'a'
#  puts longest_streak('accccbbb')    # => 'cccc'
#  puts longest_streak('aaaxyyyyyzz') # => 'yyyyy
#  puts longest_streak('aaabbb')      # => 'bbb'
#  puts longest_streak('abc')         # => 'c'

 # bi_prime?
# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

def bi_prime?(n)
    primes = []

    #find prime numbers from 2 to N
    (2...n).each do |ele|
        if prime?(ele) then primes << ele end
    end

    #see if the product of any pair of primes equals n
    primes.each_with_index do |ele1, i|
        primes.each_with_index do |ele2, j|
            if ele1 * ele2 == n
                return true
            end
        end
    end

    false

    #return true if n is bi prime
end

def prime?(n)
    (2..n/2).each do |divisor|
        if n % divisor == 0 then return false end
    end
    true
end


# # # Examples
# puts bi_prime?(14)   # => true
# puts bi_prime?(22)   # => true
# puts bi_prime?(25)   # => true
# puts bi_prime?(94)   # => true
# puts bi_prime?(24)   # => false
# puts bi_prime?(64)   # => false
# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. For example, if we encrypt "bananasinpajamas" with the key sequence [1, 2, 3], then the result would be "ccqbpdtkqqcmbodt":

# # Message:  b a n a n a s i n p a j a m a s
# # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.



def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a

    #cipher
    #for each character, move along the alphabet by the given positions
    message.each_char.with_index do |char, idx|
        new_ltr = (alpha.index(char) + keys[0]) % 26
        message[idx] = alpha[new_ltr]
        keys.rotate!
    end

    message
end

# # Examples
# puts vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# puts vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# puts vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# puts vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# puts vigenere_cipher("yawn", [5, 1])             # => "dbbo"


# vowel_rotate
# Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel that appears before it sequentially in the original string. The first vowel of the string should be replaced with the last vowel.



#abeci
#ibace

def vowel_rotate(str)
    vowels = "aeiou"
    output = ""

    o_spots = []
    n_spots = []
    str.each_char.with_index do |ltr,idx|
        if vowels.include?(ltr)
            o_spots << idx
            n_spots << idx
        end
    end
    #iterate through str, finding all vowels

    #assign each vowel to next position


    n_spots.rotate!(-1)

    str.each_char.with_index do |ltr, idx|
        if o_spots.include?(idx)
            o_spots.shift()
            output << str[n_spots[0]]
            n_spots.shift()
        else
            output << ltr
        end
    end

    output

end

# # Examples
# puts vowel_rotate('computer')      # => "cempotur"
# puts vowel_rotate('oranges')       # => "erongas"
# puts vowel_rotate('headphones')    # => "heedphanos"
# puts vowel_rotate('bootcamp')      # => "baotcomp"
# puts vowel_rotate('awesome')       # => "ewasemo"

# Proc Problems
# String#select
# Extend the string class by defining a String#select method that accepts a block. The method should return a new string containing characters of the original string that return true when passed into the block. If no block is passed, then return the empty string. Do not use the built-in Array#select in your solution.

class String
    def select(&prc)
        return "" if prc == nil

        output = ""
        self.each_char.with_index do |ltr, idx|
            if prc.call(ltr) == true
                output << ltr
            end
        end

        output
        #return new string containing characters that return true when passed to block
    end
end

# # Examples
pp "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
pp "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
pp "HELLOworld".select          # => ""


# String#map!
# Extend the string class by defining a String#map! method that accepts a block. The method should modify the existing string by replacing every character with the result of calling the block, passing in the original character and it's index. Do not use the built-in Array#map or Array#map! in your solution.


class String
    def map!(&prc)

        self.each_char.with_index do |ltr, idx|
            self[idx] = prc.call(ltr, idx)
        end
        #return self, modified by prc
    end
end

# Examples
word_1 = "Lovelace"
word_1.map! do |ch|
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"


# Recursion Problems
# multiply
# Write a method multiply(a, b) that takes in two numbers and returns their product.

# You must solve this recursively (no loops!)
# You must not use the multiplication (*) operator
# # Examples

def multiply(a,b)
    negatives = 0

    if b == 1 then return a end
    if a < 0 then
        a -= (a+a)
        negatives += 1
    end
    if b < 0 then
        negatives += 1
        b -= (b+b)
    end

    if negatives == 1
        output = a - a - a - multiply(a,b-1)
    else
        output = a + multiply(a,b-1)
    end


end


# puts multiply(3, 5)        # => 15
# puts multiply(5, 3)        # => 15
# puts multiply(2, 4)        # => 8
# puts multiply(0, 10)       # => 0
# puts multiply(-3, -6)      # => 18
# puts multiply(3, -6)       # => -18
# puts multiply(-3, 6)       # => -18


# lucas_sequence
# The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2. The second number of the Lucas Sequence is 1. To generate the next number of the sequence, we add up the previous two numbers. For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Write a method lucasSequence that accepts a number representing a length as an arg. The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.

# # Examples

def lucas_sequence(n)
    if n == 0
        return []
    elsif n == 1
        return [2]
    elsif n == 2
        return [2,1]
    end

    lucas_sequence(n-1) + [(lucas_sequence(n-1)[-1] + lucas_sequence(n-2)[-1])]

end

# pp lucas_sequence(0)   # => []
# pp lucas_sequence(1)   # => [2]
# pp lucas_sequence(2)   # => [2, 1]
# pp lucas_sequence(3)   # => [2, 1, 3]
# pp lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# pp lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]


# prime_factorization
# The Fundamental Theorem of Arithmetic states that every positive integer is either a prime or can be represented as a product of prime numbers.

# Write a method prime_factorization(num) that accepts a number and returns an array representing the prime factorization of the given number. This means that the array should contain only prime numbers that multiply together to the given num. The array returned should contain numbers in ascending order. Do this recursively.

def prime_factorization(n)
    if prime?(n) == true then return [n] end
    primes_up_to_n = []
    (0...n).each {|ele| prime?(ele) ? primes_up_to_n << ele : ele }

    largest = primes_up_to_n.inject {|acc, ele| n % ele == 0 ? ele : acc }

    [prime_factorization(n / largest)].flatten + [largest]

end





# # # Examples
# pp prime_factorization(12)     # => [2, 2, 3]
# pp prime_factorization(24)     # => [2, 2, 2, 3]
# pp prime_factorization(25)     # => [5, 5]
# pp prime_factorization(60)     # => [2, 2, 3, 5]
# pp prime_factorization(7)      # => [7]
# pp prime_factorization(11)     # => [11]
# pp prime_factorization(2017)   # => [2017]
