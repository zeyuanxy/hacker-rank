#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:14:06
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:14:14
def factorial
    yield
end

n = gets.to_i
factorial do 
    puts (1..n).reduce(:*)
end