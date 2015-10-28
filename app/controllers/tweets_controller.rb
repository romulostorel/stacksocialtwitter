class TweetsController < ApplicationController
  def index
    @tweets = TwitterSearcher.search(term: params[:search])

    expires_in 5.minutes
  end
end
