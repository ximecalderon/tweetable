class TweetsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_tweet, only: %i[show edit update destroy like like_destroy]

  # GET /tweets
  def index
    @tweets = Tweet.where(replied_to_id: nil).order(created_at: :desc)
    @tweet = Tweet.new
  end

  # GET /tweets/1
  def show
    @current_user = current_user
    @tweets = Tweet.where(replied_to_id: @tweet.id).order(created_at: :desc)
    @new_tweet = Tweet.new
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit; end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)

    @tweet.user = current_user
    if @tweet.save
      if @tweet.replied_to_id
        redirect_to @tweet.replied_to, notice: "Tweet was successfully created."
      else
        redirect_to root_path, notice: "Tweet was successfully created."
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: "Tweet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: "Tweet was successfully destroyed."
  end

  def like
    Like.create(user: current_user, tweet: @tweet)
    redirect_to request.referer
  end

  def like_destroy
    @like = Like.find_by(user: current_user, tweet: @tweet)
    @like.destroy
    redirect_to request.referer
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:body, :user_id, :replied_to_id)
  end
end
