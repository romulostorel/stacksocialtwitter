require 'rails_helper'

feature 'Tweets' do
  scenario 'Search tweets' do
    VCR.use_cassette "search_form_tweets", :record => :new_episodes do
      visit root_path

      fill_in 'search', with: 'stacksocial'

      click_button 'Search'

      expect(page).to have_content "Get it free: Free: 'The Joy of Bootstrap' Course https://t.co/gYv6Ndkq06 via @StackSocial"
    end
  end
end
