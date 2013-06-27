include ActionDispatch::TestProcess

FactoryGirl.define do
  sequence :date do |n|
    DateTime.now
  end

  sequence :string, aliases: [:title] do |n|
    "string-#{n}"
  end

  sequence :email do |n|
    "email#{n}@test.ru"
  end

  sequence :password do |n|
    "#{n}pass#{n}"
  end

  sequence :site, aliases: [:shop_site, :url] do |n|
    "http://site-#{n}.com"
  end

  sequence :integer, aliases: [:position, :group, :order, :custom_flavor_position, :weight, :quantity] do |n|
    n
  end

  sequence :true, aliases: [:newsletter,:gift_receipt, :gift_wrap] do |n|
    true
  end

  sequence :price, aliases: [:package_cost, :amount, :total, :subtotal, :delivery] do |n|
    "#{n}"
  end

  sequence :phone do |n|
    "+#{17001000600+n}"
  end

  sequence :login do |n|
    "login#{n}"
  end

  sequence :file do |n|
    fixture_file_upload('app/assets/images/logo.png', 'image/png')
  end

end
