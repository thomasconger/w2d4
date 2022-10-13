# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    multiples = []
    max = num_1 * num_2

    (1..max).each do |multiple|
        if multiple % num_1 == 0 && multiple % num_2 == 0
            multiples << multiple
        end
    end

    multiples.min
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = Hash.new(0)
    #get all substrings of length 2
    #iterate through string, counting all substrings of length 2
    str.each_char.with_index do |char, idx|
        if (idx + 1) < str.length - 1
            bigrams[str[idx..idx+1]] += 1
        end
    end
    #return the substring with the max count

    keys = bigrams.keys
    max = keys.inject do |acc, ele|
        if bigrams[ele] > bigrams[acc]
            ele
        else
            acc
        end
    end
    puts bigrams
    max
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        output = {}

        self.each do |k,v|
            output[v] = k
        end

        output
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)

        pairs = []

        self.each_with_index do |ele1, i|
            self.each_with_index do |ele2, j|
                if j < i
                    if self[i] + self[j] == num
                        pairs << [self[i], self[j]]
                    end
                end
            end
        end
        # sum pairs from self, store those that equal target in arr
        # return count of elements in pair

        pairs.length
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new {|a, b| a <=> b }
        output = self


        sorted = false
        while sorted != true
            sorted = true
            output.each_with_index do |a, idx|
                #TWO CASES
                #last ele
                if idx < output.length - 1
                    b = output[idx+1]
                    if prc.call(a,b) == 1
                        sorted = false
                        output[idx], output[idx+1] = output[idx+1], output[idx]
                    end
                else
                    #how do i escape
                end
            end
        end

        output
    end
end
