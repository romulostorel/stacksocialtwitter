module Helpers
  def self.included(receiver)
    receiver.let(:current_user) do
      User.create(email: 'user@gmail.com', password: 'user123456', password_confirmation: 'user123456')
    end
  end

  def sign_in(options={})
    visit new_user_session_path

    fill_in 'Email', with: current_user.email
    fill_in 'Password', with: 'user123456'

    click_button 'Log in'
  end
end

RSpec.configure do |config|
  config.include Helpers, :type => :feature
end
