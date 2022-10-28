# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


15.times do |n|
  EndUser.create!(
    email: "test#{n + 1}@test.com",
    name: "テスト太郎#{n + 1}",
    kana_name: "テストタロウ#{n + 1}",
    nick_name: "てすとネーム#{n + 1}",
    password: "aaa111#{n + 1}",
    is_deleted: false,
  )
end

Admin.create!(
   email: 'camp@test',
   password: 'camp11',
)

# 15.times do |n|
#   Site.create!(
#     end_user_id: n + 1,
#     name: "site#{n + 1}",
#     prefecture: n + 1,
#     site_type: 1,
#     field_type: 0,
#     daycamp: 0,
#     local_specialty: "お菓子",
#     url: "http#{n + 1}",
#     review: "reviewいいね！"
#   )
# end

# [1, 2, 3, 4, 5].each do |o|

# max_user = 10
# [10, 5, 3, 2, 1].each do |m|
#   (1..max_user).each do |end_user_id|
#     Favorite.create!(site_id: m, end_user_id: end_user_id)
#   end
#   max_user -= 2
# end
# Favorite.create!(site_id: 1, end_user_id: 10)
# Favorite.create!(site_id: 1, end_user_id: 9)
# Favorite.create!(site_id: 6, end_user_id: 11)