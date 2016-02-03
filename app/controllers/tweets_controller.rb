class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
    redirect_to '/'
  else
    render :index
  end
  end

  def edit
  end

  def update
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
  end

  private
  def tweet_params
   params.require(:tweet).permit(
    :user_id,
    :reply_tweet_id,
    :content
    )
 end


end
