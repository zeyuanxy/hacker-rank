#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:27:49
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:27:56
power_function = -> (x, z) {
    (x) ** z
}

base = gets.to_i
raise_to_power = power_function.curry.(base)

power = gets.to_i
puts raise_to_power.(power)