#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:34:37
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:34:46
require 'prime'

n = gets.to_i
primes = Prime.lazy.select do |p|
    p.to_s.reverse == p.to_s
end.take(n).to_a

p primes