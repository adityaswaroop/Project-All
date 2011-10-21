require 'spec_helper'

describe 'home page' do
  it 'welcomes the user' do
    visit '/'
    page.should have_content('Log in')
  end
end

describe 'Landing page' do
  it 'lets the user login', :js => true do
    visit new_user_path
    fill_in 'Name', :with => 'test123'
    fill_in 'Username', :with => 'test123'
    fill_in 'Email Address', :with => 'test123@gmail.com'
    fill_in 'Password', :with => 'test123'
    click_on 'Sign up'
    page.should have_content('Welcome to Relyon')
  end
end