require 'rails_helper'

RSpec.describe UsersController, type: :controller do 

  describe '#new' do 
    
    it "should get the :new form to sign up a user" do 
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do 

    
    context 'valid params' do 

        before(:each) do
            post :create, params: { user: {username: "JerrySeinfeld", password: "password"}}
        end

        it 'should save user to db' do 
            expect(User.last.username).to eq("JerrySeinfeld")
        end
        # TODO login!(@user)

        it 'should redirect to :show' do 
            expect(response).to redirect_to(user_url(User.last))
        end
    end

    context 'invalid params' do 
        before(:each) do
            post :create, params: { user: {username: "JerrySeinfeld", password: "short"}}
        end

        it 'should render the :new page' do
            expect(response).to render_template(:new)
        end
        
        it 'should add errors to flash' do
            expect(flash[:errors]).to be_present
        end
    end
  end
  








end