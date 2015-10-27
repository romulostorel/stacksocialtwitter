require "rails_helper"

RSpec.describe TwitterSearcher do
  let(:search) { described_class.search(term: "stacksocial") }

  it 'limit to search only 25 twteets' do
    VCR.use_cassette('tweets', :match_requests_on => [:method, :uri]) do
      expect(search.size).to eq 25
    end
  end

  it 'tweets need to have content' do
    VCR.use_cassette('tweets', :match_requests_on => [:method, :uri]) do
      expect(search.first.text).to eq 'From  iOS to Javascript - learn it all for $49 with the Code Like A Pro Bundle: https://t.co/FnJVtLU0mV https://t.co/89xj7Ao5jH'
    end
  end

  it 'tweets need to have time' do
    VCR.use_cassette('tweets', :match_requests_on => [:method, :uri]) do
      expect(search.first.created_at).to eq '2015-10-27 23:00:04 +0000'
    end
  end

  it 'return empty array when term is nil' do
    VCR.use_cassette('tweets', :match_requests_on => [:method, :uri]) do
      expect(described_class.search(term: nil)).to eq []
    end
  end
end
