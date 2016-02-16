#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:10:12
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:10:27
def convert_temp(n, opt)
    n = case opt[:input_scale]
            when 'kelvin' then n - 273.15
            when 'fahrenheit' then (n - 32) * 5 / 9.0
            else n
        end
    r = case opt[:output_scale]
            when 'kelvin' then n + 273.15
            when 'fahrenheit' then n * 9/5.0 + 32
            else n
    end
    r
end