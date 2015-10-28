class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = TwitterSearcher.search(term: params[:search])

    expires_in 5.minutes
  end
end
