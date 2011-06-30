class HomeController < ApplicationController
  
  def index
    @editions = Edition.order("created_at DESC").all
  end
  
end