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
end

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true