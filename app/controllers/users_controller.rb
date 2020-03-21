class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
    @all_tweets = current_user.tweets
  end

  def follow
    user = User.find(params[:id])
    current_user.following.create(follower_id: current_user.id, user_id: user.id)
  end

  def unfollow
    user = User.find(params[:id])
    current_user.following.find_by(user_id: user.id).destroy if (current_user.following.find_by(user_id: user.id))
  end
end
