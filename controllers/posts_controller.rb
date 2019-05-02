class PostController < Sinatra::Base   ## Sinatra is a Module with Base class inside

puts File.dirname(__FILE__)
puts "--------------"
puts File.join(File.dirname(__FILE__), '..')
puts File.join(root, "views")

##### Set the root of the parent directory of the current file

set :root, File.join(File.dirname(__FILE__), '..') ## _FILE_ gives current file. ".." means join a ..


##### Sets the views directory
set :views, Proc.new { File.join(root, "views") }


  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
    id: 0,
    title: "Post1",
    body: "This is the 1st post"
    },
    {
    id: 1,
    title: "Post2",
    body: "This is the 2nd post"
    },
    {
    id: 2,
    title: "Post3",
    body: "This is the 3rd post"
    }]


  get "/" do

    @title = "This is the title of the blog"

    @posts = $posts

    erb :'posts/index'

  end

  get "/new" do
    @post = {
      id: "",
      title: "",
      body: ""
    }
    erb :'posts/new_page'
  end

  post "/" do

    new_post = {
      id: $posts.length,
      title: params[:title],
      body: params[:body]

    }
    $posts.push(new_post)
    redirect "/"
  end

  get "/:id" do
    id = params[:id].to_i
    @post = $posts[id]
    erb  :'posts/show'
  end

  get "/:id/edit" do
    id = params[:id].to_i
    @post = $posts[id]
    erb :'posts/edit_page'
  end

  put "/:id" do
    id = params[:id].to_i

    # post = $posts[id]

    $posts[id][:title] = params[:title]
    $posts[id][:body] = params[:body]

    # $posts[id] = post

    redirect "/"

    end

  delete "/:id" do
    id = params[:id].to_i

    $posts.delete_at(id)

    redirect "/"
  end

end
