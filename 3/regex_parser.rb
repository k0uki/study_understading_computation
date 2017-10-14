require 'treetop'
require_relative 'regex'

Treetop.load('my_regex')

tree = PatternParser.new.parse('(a(|b))*')
ptn =  tree.to_ast

p ptn.matches?('abaab')
p ptn.matches?('abba')
