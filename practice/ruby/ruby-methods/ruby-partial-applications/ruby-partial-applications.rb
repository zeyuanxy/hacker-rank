#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:26:28
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:26:34
combination = -> (n) do
    -> (r) do
        k = 1
        r.times{|i| k = k * (n - i) / (i + 1)}
        k
    end
end

n = gets.to_i
r = gets.to_i
nCr = combination.(n)
puts nCr.(r)