require 'sinatra'
require 'sinatra/contrib' ## reload located here
require_relative './controllers/posts_controller'

run PostController
