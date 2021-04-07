require 'spec_helper'
require 'rails_helper'

feature 'Adding a user', type: :feature do 

  before(:each) do 
    visit(new_user_url)
  end

  scenario 'takes in a username' do 
    expect(page).to have_content('Username')
  end

  scenario 'takes in a password' do 
    expect(page).to have_content('Password')
  end 
  
  scenario 'is a sign up page' do 
    expect(page).to have_content('Sign Up')
  end

  scenario 'has a submit button' do 
    expect(page).to have_button(value: 'Submit!')
  end
  
end

# scenario 'redirects to :show' do 
#   expect(page).to have_content()
# end


