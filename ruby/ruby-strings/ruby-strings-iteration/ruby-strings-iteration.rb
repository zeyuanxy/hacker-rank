#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:41:28
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:41:34
def count_multibyte_char(s)
    s.each_codepoint.count{|e| e > 256} 
end
