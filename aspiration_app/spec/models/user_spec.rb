require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validations' do

        before(:each) do 
            create(:user)
        end
        # subject(:test_user) { FactoryBot.build(:user)}
        # subject(:test_user) { User.create!(username: "test_user", password: "password")}

        it { should validate_presence_of(:username)}
        it { should validate_uniqueness_of(:username)}
        it { should validate_presence_of(:password)}
        it { should validate_length_of(:password).is_at_least(6)}
        it { should validate_presence_of(:password_digest)}
        it { should validate_presence_of(:session_token)}
    end

    describe 'class and instance method' do

    end
end