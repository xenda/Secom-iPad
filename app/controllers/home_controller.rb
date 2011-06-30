class HomeController < ApplicationController
  
  def index
    @editions = Edition.where("numero >= '1270'").order("created_at DESC").all
  end
  
end