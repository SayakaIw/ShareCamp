# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


11.times do |n|
  EndUser.create!(
    email: "test#{n + 1}@test.com",
    name: "太郎#{n + 1}",
    kana_name: "タロウ#{n + 1}",
    nick_name: "テスタロウ#{n + 1}",
    password: "aaa111#{n + 1}",
    is_deleted: false,
  )
end

Admin.create!(
   email: 'camp@test',
   password: 'camp11',
)

15.times do |n|
  Site.create!(
    end_user_id: n + 1,
    name: "site#{n + 1}",
    prefecture: n + 1,
    site_type: 1,
    field_type: 0,
    daycamp: 0,
    local_specialty: "お菓子",
    url: "http#{n + 1}",
    review: "reviewいいね！"
  )
end