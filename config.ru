require 'sinatra'
require 'sinatra/contrib' ## reload located here
require_relative './controllers/posts_controller'

use Rack::MethodOverride

run PostController
