require 'treetop'
Treetop.load('lambda_calculus_rule')

require_relative 'lambda_calculus'

parse_tree = LambdaCalculusParser.new.parse('-> x { x[x] }[-> y { y }]')
p parse_tree
expression = parse_tree.to_ast
p expression
p expression.reduce
