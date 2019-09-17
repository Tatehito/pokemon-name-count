# JSONファイルを読み込む
require 'json'
json_data = open('pokemon_data.json') do |io|
    JSON.load(io)
end

puts '---語尾を数える---'
p json_data.map { |data|
    data['name'][-1]
}.tally.sort

puts '---頭文字を数える---'
p json_data.map { |data|
    data['name'][0]
}.tally.sort