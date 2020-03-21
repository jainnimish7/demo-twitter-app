class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    if current_user.present?
      tweet = current_user.tweets.new(tweet_params)
      if tweet.save
        redirect_to root_path
      else
        render ‘new’
      end
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:title, :description, :user_id)
  end
end
