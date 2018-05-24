# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#ユーザの追加
#User.create(name: 'shimizu4', email: 'shimizu4@shimizu.co.jp', password: 'shimizu4') 
#User.create(name: 'shimizu5', email: 'shimizu5@shimizu.co.jp', password: 'shimizu5') 
#User.create(name: 'shimizu6', email: 'shimizu6@shimizu.co.jp', password: 'shimizu6') 

#(7..10).each do |number|
#  User.create(name: 'shimizu' + number.to_s, email: 'shimizu' + number.to_s + '@shimizu.co.jp', password: 'shimizu' + number.to_s) 
#end


#コースの追加
(31..40).each do |number|
Course.create(name: "テスト講座"+ number.to_s, major_no: 1, content: "ここに講座の内容"+ number.to_s, user_id: 2) 
end