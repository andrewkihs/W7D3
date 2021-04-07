require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validations' do

        before(:each) do 
            create(:user)
        end
        # subject(:user) { FactoryBot.build(:user)}
        # subject(:user) { User.create!(username: "test_user", password: "password")}

        it { should validate_presence_of(:username)}
        it { should validate_uniqueness_of(:username)}
        it { should validate_length_of(:password).is_at_least(6)}
        it { should validate_presence_of(:password_digest)}
        it { should validate_presence_of(:session_token)}
    end

    describe "#is_password? test" do
       let(:user) {create(:user)}
       
        context 'with valid params' do
            it 'should return true' do 
                expect(user.is_password?('password')).to be true
            end
        end

        context 'with invalid params' do
            it 'should return false' do 
                expect(user.is_password?('not the right pw')).to be false
            end
        end
    end

    describe '::find_by_credentials' do 
        babs = FactoryBot.create(:user, username: "babs")

        context 'with valid user' do 
            it 'should return the user' do 
                expect(User.find_by_credentials("babs", "password")).to eq(babs)
            end
        end
        
        context 'with invalid user' do 
            it 'should return nil if not found' do 
                expect(User.find_by_credentials("babs", "no-password")).to be_nil
            end
        end

    end

   
end