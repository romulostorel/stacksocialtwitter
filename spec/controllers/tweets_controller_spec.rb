require "rails_helper"

RSpec.describe TweetsController, type: :controller do
  describe "GET index" do
    let(:cache_duration) { 5.minutes }

    it 'set http cache' do
      expect(controller).to receive(:expires_in).with(cache_duration)

      get :index
    end

    it 'call TwitterSearcher to search tweets and setting it in a variable' do
      expect(TwitterSearcher).to receive(:search).with(term: 'something')

      get :index, search: 'something'
    end
  end
end
