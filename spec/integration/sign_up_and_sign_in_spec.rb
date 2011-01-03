# encoding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/integration_helper')

describe "User handling", :type => :integration do

  before :each do
    visit front_page
  end

  it 'should demo some javascript', :js => true do
    click 'sign up'
    find('//*[@id="user_zipcode"]').should be_visible
    element = locate('#user_zipcode')
    element.should be_visible

    element.hide!
    element.should_not be_visible
  end

  it 'should autocomplete when the zipcode is entered', :js => true do
    Zipcode.create(:zipcode => '8000', :city => 'Århus C')

    click 'sign up'
    fill_in 'Zipcode', :with => '8000'
    fill_in 'Email', :with => 'joe@erichsen.net'
    page.should have_content('Århus C')
  end

  it "should be possible to sign up" do
    click 'sign up'
    fill_in 'Email', :with => 'joe@erichsen.net'
    fill_in 'Password', :with => 'verysecret'
    fill_in 'Password confirmation', :with => 'verysecret'
    click_button 'Sign up'
    # save_and_open_page

    page.should have_content('You have signed up successfully')
  end

  it 'should be possible to sign in' do
    user = User.create(:email => 'joe@erichsen.net', :password => 'verysecret')

    click 'sign in'
    fill_in 'Email', :with => 'joe@erichsen.net'
    fill_in 'Password', :with => 'verysecret'
    click_button 'Sign in'

    page.should have_content('Signed in successfully')
  end


end
