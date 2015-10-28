require "rails_helper"

RSpec.describe TweetsHelper, type: :helper do
  describe "#tweet_content" do
    it "attach link to worlds that starts with @" do
      expect(helper.tweet_content('some tweet from @someone')).to eq "some tweet from <a target='_blank' href='http://twitter.com/someone'>@someone</a>"
    end
  end
end
