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

end