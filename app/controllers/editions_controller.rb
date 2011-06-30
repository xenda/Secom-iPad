class EditionsController < InheritedResources::Base
  
  def update
    update! { root_path }
  end
  
end