# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
Product.delete_all
Product.create(
  :title=> '烤雞套餐(1/4雞)', 
  :description=> '店家招牌商品，一整盤軟q的德國豬腳，搭配啤酒最對味。',
  :image_url=> 'http://www.doggybag.com.tw/images/content/sd24252.jpg',
  :price=> 200
)
Product.create(
  :title=> '德國豬腳套餐', 
  :description=> '店家招牌商品，一整盤軟q的德國豬腳，搭配啤酒最對味。',
  :image_url=> 'http://www.doggybag.com.tw/images/content/sd24252.jpg',
  :price=> 200
)
Product.create(
  :title=> '紐奧良雞翅套餐', 
  :description=> '店家招牌商品，一整盤軟q的德國豬腳，搭配啤酒最對味。',
  :image_url=> 'http://www.doggybag.com.tw/images/content/sd24252.jpg',
  :price=> 180
)
Product.create(
  :title=> '香煎魚排套餐', 
  :description=> '店家招牌商品，一整盤軟q的德國豬腳，搭配啤酒最對味。',
  :image_url=> 'http://www.doggybag.com.tw/images/content/sd24252.jpg',
  :price=> 210
)