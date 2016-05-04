# -*- coding: utf-8 -*-
# @Author: Zeyuan Shang
# @Date:   2016-05-04 13:42:29
# @Last Modified by:   Zeyuan Shang
# @Last Modified time: 2016-05-04 13:46:02
from HTMLParser import HTMLParser

class MyHTMLParser(HTMLParser):
	def handle_starttag(self, tag, attrs):
		print tag
		for attr in attrs:
			print '->', ' > '.join(attr)

parser = MyHTMLParser()

html = ''
for i in xrange(input()):
	html += raw_input() + '\n'
parser.feed(html)