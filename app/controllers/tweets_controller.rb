class TweetsController < ApplicationController
  def index
    @tweets = TwitterSearcher.search(term: params[:search])
  end
end
