class TweetsController < ApplicationController
  def create
    @tweet = current_user.tweets.build(params_tweets)
    if @tweet.save
      flash[:success] = '投稿しました'
      redirect_to root_url
    else
      flash.now[:danger] = '投稿できませんでした'
      render 'toppages#index'
    end
  end

  def destroy
  end
  
  private
  def params_tweets
    params.require(:tweet).permit(:content)
  end
end
