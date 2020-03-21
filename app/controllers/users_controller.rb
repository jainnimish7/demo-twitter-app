class UsersController < ApplicationController

  def index
    @all_tweets = current_user.tweets
  end
end
