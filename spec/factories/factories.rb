FactoryGirl.define do
  factory :location do
    url FFaker::Internet.http_url
  end

  factory :image do
    banner { File.new(Rails.root.join('app', 'assets', 'images', 'test_image.jpg')) }
  end
end