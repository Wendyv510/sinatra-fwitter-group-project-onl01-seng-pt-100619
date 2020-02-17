class UsersController < ApplicationController
  
  get '/users/signup' do 
    
    erb :signup 
  end 
  
  post '/signup' do 
    @user = User.new(username: params[:username], email: params[:email], password: params[:password]) 
    @user.save 
    session[:user_id] = user.id 
    
    redirect to "/users/home" 
  end 
  
  get '/login' do 
    
    erb :login 
  end 
  
  post '/login' do 
    @user = User.find_by(email: params[:email], password: params[:password]) 
       if @user 
         session[:user_id] = user.id 
           redirect to '/users/home' 
       else 
          redirect to '/login' 
       end 
  end 
  
  get '/logout' do 
    session.clear 
      redirect to '/' 
  end 
  
  get '/users/home' do 
    @user = User.find(session[:user.id])
    
    erb :home 
  end 
  

end
