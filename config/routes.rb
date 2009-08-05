ActionController::Routing::Routes.draw do |map|
  map.resources :fafactories, :only => [:none], 
      :collection => { :create_instance => :post }
end