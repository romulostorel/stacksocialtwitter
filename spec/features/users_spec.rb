require 'rails_helper'

feature 'Users' do
  scenario 'Sign up' do
    VCR.use_cassette "search_form_tweets", :record => :new_episodes do
      visit root_path

      click_link 'Sign up'

      fill_in 'Email', with: 'user@domain.com'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'

      click_button 'Sign up'

      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end

  scenario 'Sign' do
    VCR.use_cassette "search_form_tweets", :record => :new_episodes do
      user = User.create(email: 'user@gmail.com', password: 'user123456', password_confirmation: 'user123456')

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'user123456'

      click_button 'Log in'

      expect(page).to have_content 'Signed in successfully.'
    end
  end

  scenario 'Logout' do
    VCR.use_cassette "search_form_tweets", :record => :new_episodes do
      sign_in

      click_link current_user
      click_link 'Log out'

      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end
end
