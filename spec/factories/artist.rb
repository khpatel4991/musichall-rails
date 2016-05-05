FactoryGirl.define do
  factory :artist do
    artistName {Faker::Name.name}
    sequence(:artistPopularityAll) { |n| n}
    sequence(:artistPopularityRecent) { |n| n }
    factory :artist_with_100_songs do
      after(:create) do |artist|
        100.times do
          create(:song, artist_id: artist.id)
        end
      end
    end
  end
end