# JSONファイルを読み込む
require 'json'
json_data = open('pokemon_data.json') do |io|
    JSON.load(io)
end

# 語尾変換用ハッシュ
conversion = {'ァ' => 'ア', 
            'ィ' => 'イ',
            'ゥ' => 'ウ',
            'ェ' => 'エ',
            'ォ' => 'オ',
            'ャ' => 'ヤ',
            'ュ' => 'ユ',
            'ョ' => 'ヨ',
            'ッ' => 'ツ',
            '2' => 'ツ',
            'Z' => 'ト',
            '♂' => 'ス',
            '♀' => 'ス'}
            
puts '---語尾を数える---'
p json_data.map { |data|
    if data['name'][-1] == 'ー'
        # 語尾が長音の場合
        data['name'][-2]
    elsif data['name'][-1] =~ /[ァィゥェォャュョッ2Z♂♀]/
        # 語尾が小文字・特殊文字の場合
        data['name'][-1].sub(/./,conversion)
    else
        data['name'][-1]
    end
}.tally.sort

puts '---頭文字を数える---'
p json_data.map { |data|
    data['name'][0]
}.tally.sort