class EditionsController < InheritedResources::Base
  
  def update    
    update! do
      @edition.update_structures
      root_path
    end

  end
  


end