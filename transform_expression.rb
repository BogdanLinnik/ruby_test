# frozen_string_literal: true

def level(operator)
  case operator
  when '^'
    3
  when '*', '/'
    2
  when '+', '-'
    1
  when '('
    0
  end
end

number_of_expressions = gets.to_i
expressions = []

number_of_expressions.times do
  expressions << gets
end

expressions.each do |expression|
  stack = []
  rpn_expression = ''

  expression.split('').each do |symbol|
    case symbol
    when '('
      stack.push symbol
    when /[a-z]/
      rpn_expression += symbol
    when '*', '/', '+', '-', '^'
      finished = false
      until finished || stack.empty?
        if level(symbol) > level(stack.last)
          finished = true
        else
          rpn_expression += stack.pop
        end
      end
      stack.push symbol
    when ')'
      rpn_expression += stack.pop until stack.last == '('
      stack.pop
    end
  end

  rpn_expression += stack.pop until stack.empty?

  puts rpn_expression
end
