#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:17:26
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:17:33
def square_of_sum (my_array, proc_square, proc_sum)
    sum = proc_sum.call(my_array)
    proc_square.call(sum)
end

proc_square_number = proc {|n| n ** 2}
proc_sum_array     = proc {|a| a.reduce(0, :+)}
my_array = gets.split().map(&:to_i)

puts square_of_sum(my_array, proc_square_number, proc_sum_array)