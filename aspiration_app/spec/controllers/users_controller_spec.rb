require 'rails_helper'

RSpec.describe UsersController, type: :controller do 

  describe '#new' do 
    
    it "should get the :new form to sign up a user" do 
      get :new
      expect(response).to render(:new)
    end
  end

  describe '#create' do 
    let(:user) { FactoryBot.create(:user) }
    
    context 'valid params' do 
      it 'should save user to db' do 
        post :create, user: { username: "babs", password: "password"}
        expect(User.last.username).to eq("babs")
      end

      it 'should redirect to index? or main page' do 
        
      end
    end

    context 'invalid params' do 
      # should render the :new page
      # should add errors to flash
    end
  end
  








end