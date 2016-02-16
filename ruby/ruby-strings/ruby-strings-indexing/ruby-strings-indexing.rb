#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:39:56
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:40:04
def serial_average(s)
    s=~/^(\d+)-(.+)?-(.+)$/
    $1+'-'+'%.2f'%[($2.to_f+$3.to_f)/2]
end
