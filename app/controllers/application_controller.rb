class ApplicationController < ActionController::Base
  require 'pry'
  protect_from_forgery with: :exception
end
