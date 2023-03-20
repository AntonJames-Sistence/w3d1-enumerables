class Array
    def my_each(&blc) # { |ele| new_arr << ele if blc[ele] == true }
        i = 0
        while i < self.length
            blc.call(self[i])
            i+=1
        end
        self
    end

    def my_select(&blc) # suppose to take a block with boolean 
        new_arr = []

        self.my_each { |ele| new_arr << ele if blc[ele] }

        new_arr
    end

    def my_reject(&blc)
        result = []
            self.my_each { |ele| result << ele if blc[ele] == false }
        result 
    end

    def my_any?(&blc)
        self.my_each {|ele| return true if blc[ele]}
        false
    end

    def my_all?(&blc)
        self.my_each {|ele| return false if !blc[ele]}
        true
    end

    def my_flatten
        # return [self] if self.is_a?(Integer)

        temp_arr = []

        self.my_each do |ele|
            if !ele.is_a?(Array)
                temp_arr << ele
            else
                temp_arr += ele.my_flatten
            end
        end

        temp_arr
    end

    def my_zip(*ele) 
        result = Array.new(self.length){ Array.new(ele.length+1) {nil} }

        idx = 0
        while idx < self.length
            result[idx][0] = self[idx] 
            idx+=1
        end

        i = 1
        while i <= ele.length
            j = 0
            while j < ele.length+1
                result[j][i] = ele[i-1][j]
                j+=1
            end
            i+=1
        end

        result
    end

        
end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
# print [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# print a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# print [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
print [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

