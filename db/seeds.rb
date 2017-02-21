# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!([{email: 'admin@example.com', password: 'password', password_confirmation: 'password'},{email: 'aadeshere1@gmail.com', password: 'helloworld', password_confirmation: 'helloworld'}]) unless AdminUser.any?

Tag.create([
  {name: "駅チカ"}, {name: "未経験歓迎"}, {name: "シフト自由"}, {name: "土日・週末のみOK"}, {name: "夜勤"}, {name: "交通費支給"}
]) if Tag.count == 0


UniqueIdStore.create(male: 30000, female: 60000) if UniqueIdStore.count == 0

faq_title = %w(勤務開始までの流れ ＷＥＢ登録について 登録説明会について お仕事内容について 給料について その他)

faq_title.each {|title| FaqCategory.create(name: title)} if FaqCategory.count == 0
