class Site < ApplicationRecord
  has_one_attached :image
  belongs_to :end_user

  enum prefecture:{ hokkaido:0,
    aomori:1,iwate:2,miyagi:3,akita:4,yamagata:5,fukushima:6,ibaraki:7,
    tochigi:8,gunma:9,saitama:10,chiba:11,tokyo:12,kanagawa:13,niigata:14,
    toyama:15,ishikawa:16,fukui:17,yamanashi:18,nagano:19,gifu:20,
    sizuoka:21,aichi:22,mie:23,shiga:24,
    kyoto:25,osaka:26,hyogo:27,nara:28,wakayama:29,tottori:30,
    shimane:31,okayama:32,hiroshima:33,yamaguchi:34,tokushima:35,
    kagawa:36,ehime:37,kouchi:38,fukuoka:39,
    saga:40,nagasaki:41,kumamoto:42,oita:43,miyazaki:44,kagoshima:45,okinawa:46
  }

  #enum site_type:{ section:0,free:1,cottage:2,glamping:3 }
  enum field_type:{ forest:0,grass:1,riverside:2,seaside:3,lakeside:4 }
  enum daycamp:{ have:0,nothing:1,notclear:2 }




end
