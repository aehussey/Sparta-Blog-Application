class PostController < Sinatra::Base   ## Sinatra is a Module with Base class inside

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Homepage for days"
  end

  get "/new" do
    "New Blog post"
  end

  post "/" do
    "This is the CREATE link"
  end

  get "/:id" do
    id = params[:id]
    "SHOWS blog with ID - #{id}"
  end

  get "/:id/edit" do
    id = params[:id]
    "Show EDIT form for blog with ID - #{id}"
  end

  put "/:id" do
    id = params[:id]
    "This is the Update function for ID - #{id}"
  end

  delete "/:id" do
    id = params[:id]
    "Blog ID - #{id} is now deleted"
  end

end
