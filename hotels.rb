#frozen_string_literal: true

first_string = gets.split(' ')
number_of_hotels = first_string.first.to_i
sroljo_prise = first_string.last.to_i

second_string = gets.split(' ')

hotels_prices = []

number_of_hotels.times do |i|
  hotels_prices << second_string[i].to_i
end

start = 0
max_sum = 0
current_sum = 0

number_of_hotels.times do |i|
  current_sum += hotels_prices[i]

  while current_sum > sroljo_prise
    current_sum -= hotels_prices[start]
    start += 1
  end

  max_sum = [max_sum, current_sum].max if current_sum <= sroljo_prise
end

puts max_sum
