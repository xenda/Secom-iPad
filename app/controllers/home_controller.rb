class HomeController < ApplicationController
  
  def index
    @editions = Edition.all
  end
  
end