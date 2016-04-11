#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:46:03
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:46:09
def strike(s)
    '<strike>' + s + '</strike>'
end

def mask_article(s, a) 
    a.each{|e| s.gsub!(e, &method(:strike)) };
    s 
end
