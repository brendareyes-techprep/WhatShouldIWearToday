
class ApplicationController < ActionController::Base
  skip_forgery_protection
  layout 'application'
  include Pundit
end
