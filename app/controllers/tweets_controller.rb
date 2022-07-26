class TweetsController < ApplicationController
    def index
        @tweets=Tweet.all
        @tweet=Tweet.new()

    end
    
    def new
        @tweet=Tweet.new

    end
    
    def edit

    end
    
    def create

    end
    
    def destroy
        
    end
   

end

end
