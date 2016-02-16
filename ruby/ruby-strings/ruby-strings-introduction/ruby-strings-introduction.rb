#!/usr/bin/ruby
# @Author: Zeyuan Shang
# @Date:   2016-02-16 21:36:27
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-02-16 21:36:35
def single_quote
    'Hello World and others!'
end

def double_quote
    "Hello World and others!"
end

def here_doc
    <<-HERE
Hello World and others!
HERE
end
