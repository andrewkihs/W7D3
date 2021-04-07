FactoryBot.define do
    factory :user do
        username { Faker::Kpop.iii_groups}
        password {'password'}
    end
end