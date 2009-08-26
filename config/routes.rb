ActionController::Routing::Routes.draw do |map|
  if Rails.env == "test"
    map.resources :fafactories, :only => [:none], 
        :collection => { :create_instance => :post, :purge => :delete,
            :find => :get }
  end
end