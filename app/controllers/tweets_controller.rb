class TweetsController < ApplicationController
  
  get '/tweets' do 
     @tweeets = Tweet.all 
     
     erb :index 
   end 
   
   get '/tweets/new' do
     erb :new 
   end 
   
   post '/tweets' do 
     @tweet = Tweet.create(content: params[:content]) 
     @tweet.save 
     
      redirect to "/tweets/#{@tweet.id}"  
   end 
   
   get '/tweets/:id' do 
     @tweet = Tweet.find_by_id(params[:id]) 
     
     erb :show 
   end
   
   get '/tweets/:id/edit' do 
     @tweet = Tweet.find_by_id(params[:id]) 
    
    erb :show 
   end 
  
   patch '/tweets/:id' do 
     @tweet = Tweet.find_by_id(params[:id]) 
     @tweet.content = params[:content] 
     
     redirect to "/tweets/#{@tweet.id}" 
   end 
   
   delete '/tweets/:id' do 
     @tweet = Tweet.find_by_id(params[:id])
     @tweet.delete 
     
     redirect to "'/tweets" 
   end 
   
      
end
