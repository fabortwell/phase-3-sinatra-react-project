class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # Add your routes here
    
    get "/posts" do
      posts = Post.all.order(:created_at)
      posts.to_json
    end
    
    post "/posts" do
      post = Post.create(content: params[:content], title: params[:title], category: params[:category], username: params[:username])
      post.to_json
    end
    
    patch "/posts/:id" do
      post = Post.find(params[:id])
      post.update(content: params[:content])
      post.to_json
    end
    
    delete "/posts/:id" do
      post = Post.find(params[:id])
    
      post.to_json
    end
  end
  