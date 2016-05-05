FactoryGirl.define do
  factory :song do
    songName {Faker::Name.name}
    songLanguage 'English'
    songCountry 'USA'
    sequence(:youtubeId) {|n| "yid_#{n}"}
    sequence(:crawlDelta) {|n| n}
  end
end
