class UsersController < ApplicationController
  before_action :fetch_user, except: [:index]

  def index
    @users = User.where.not(id: current_user.id)
    user_ids = current_user.following.pluck(:user_id) << current_user.id
    @all_tweets = Tweet.where("user_id IN (?)", user_ids)
  end

  # User details for followers and following
  def show
    @user_detail = {}
    @user_detail['following_count'] = current_user.following.count
    @user_detail['followers_count'] = current_user.followers.count
  end

  # Create followers
  def follow
    current_user.following.create(follower_id: current_user.id, user_id: @user.id)
    respond_to do |format|
      format.js
    end
  end

  # Unfollow user
  def unfollow
    current_user.following.find_by(user_id: @user.id).destroy if (current_user.following.find_by(user_id: @user.id))
  end

  private

  def fetch_user
    @user = User.find(params[:id])
  end
end
