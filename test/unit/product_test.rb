require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products 

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors['title'].any?
    assert product.errors['description'].any?
    assert product.errors['price'].any?
    assert product.errors['image_url'].any?
  end


  test "product price must greater than zero" do
    product = Product.new(:title=> 'Summer love cake',
          :description=> 'lovely cake , suit for lover.',
          :image_url=>'http://www.dsosf.com/fwfw.jpg',
          :price=>0)
   
    #確定價錢是非法的值
    assert product.invalid?
    assert_equal "must be greater than 0", product.errors[:price].join(';')

    #確定價錢是非法的值
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than 0", product.errors[:price].join(';')

    #確定價錢是合法的值
    product.price = 100
    assert product.valid?
    
  end







  #新增一筆資料
  def new_product(image_url)
    Product.new(:title=> 'Summer love cake',
                :description=> 'lovely cake , suit for lover.',
                :image_url=> image_url,
                :price=>100)
  end











  #檢驗圖片的URL是否為合法的URL
  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.gif FRED.JPG http://a.b.c/x/y/z/fred.gif }
    bad = %w(fred.doc fred.gif/more fred.gif.more)

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end

  end












  #檢驗產品標題是否具有唯一性
  test "product is not vaild without a unique title" do
    product = Product.new(:title => products(:ruby).title,
                          :description=> 'yyy',
                          :price=>100,
                          :image_url=>'yyy.png')
    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end


end
