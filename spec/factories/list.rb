#自分で書いた Faker::title.characters(number10)
#FactoryBotをまず定義する
FactoryBot.define do
  #モデルを指定する
  factory :list do
    #カラムをしていして、{}の中に入れたい値を入れる。
    title { Faker::Lorem.characters(number:10) }
    body { Faker::Lorem.characters(number:30) }
    #Loremはダミーテキスト //charactersは文字列 //(number:数値)は文字数
  end
end