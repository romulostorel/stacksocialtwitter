require 'rails_helper'

feature 'Tweets' do
  scenario 'Search tweets' do
    VCR.use_cassette "search_form_tweets", :record => :new_episodes do
      sign_in

      visit root_path

      fill_in 'search', with: 'stacksocial'

      click_button 'Search'

      expect(page).to have_content "Get it free: Free: 'The Joy of Bootstrap' Course https://t.co/gYv6Ndkq06 via @StackSocial"
    end
  end

  scenario 'Show tweet content, user and date' do
    VCR.use_cassette "search_form_tweets", :record => :new_episodes do
      sign_in

      fill_in 'search', with: 'stacksocial'

      click_button 'Search'

      expect(page).to have_content "Get it free: Free: 'The Joy of Bootstrap' Course https://t.co/gYv6Ndkq06 via @StackSocial"
      expect(page).to have_content 'Dima Lee / 27 Oct 23:41'
    end
  end

  scenario 'Linking twitter owner link' do
    VCR.use_cassette "search_form_tweets", :record => :new_episodes do
      sign_in

      fill_in 'search', with: 'stacksocial'

      click_button 'Search'

      expect(page).to have_link 'Dima Lee'
    end
  end
end
