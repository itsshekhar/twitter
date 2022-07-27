class TweetsController < ApplicationController
    before_action :set_tweet, only: [:show , :edit , :update, :destroy]
     before_action :authenticate_user! ,except: [:index, :show]
    def index
        @tweets=Tweet.all.order("created_at DESC")
        @tweet=Tweet.new()

    end
    
     
    def show
        @tweet = Tweet.find(params[:id])
   end

   def new
         @tweet=current_user.tweets.build
   end

   def create
    p "-------------------------------"
    p tweet_params
    @tweet = current_user.tweets.build(tweet_params)
#     @tweet.user_id=1
         if @tweet.save
         redirect_to root_path
         else
         render :new, status: :unprocessable_entity
         end
    end

    def edit
         @tweet=Tweet.find(params[:id])
    end

    def update
         @tweet = Tweet.find(params[:id])
         puts params
         puts"-------------------------------"
         if @tweet.update(tweet_params)
           redirect_to tweet_url(@tweet[:id])
         else
           render :edit, status: :unprocessable_entity
         end
    end  

    def destroy
         @tweet = Tweet.find(params[:id])
         @tweet.destroy
         redirect_to tweet_index_path, status: :see_other
    end
         
    private
    def tweet_params  
        p"========================"
         params.require(:tweet).permit(:body)
   end

end
