require 'rubygems'
require 'treetop'
Treetop.load 'my_grammar'
# or just:
# require 'my_grammar' # This works because Polyglot hooks "require" to find and load Treetop files

parser = MyGrammarParser.new
puts parser.parse('hello chomsky')         # => Treetop::Runtime::SyntaxNode
puts parser.parse('silly generativists!')  # => nil
