100.times do 
  Shark.create(
              :common_name => "#{Faker::Address.street_name} Shark",
              :latin_name => "Charcarodon #{Faker::Lorem.word}",
              :habitat_range => "#{Faker::Name.last_name} Ocean",
              :attacks_on_humans =>  Faker::Number.number(2),
              :suitability_as_pet => false
              )
end