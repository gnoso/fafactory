require 'active_resource'

class Fafactory < ActiveResource::Base
  FAFACTORY_CONFIG = YAML.load('config/fafactory.yml')
  
  # Creates a new instance of a remote model using the data provided.
  def self.create_instance(service, model, data)
    Fafactory.configure_site(service)
    result = Fafactory.post :create_instance, nil, 
        { :model => model, :data => data }.to_xml
    
    return Hash.from_xml(result.body)
  end
  
  def self.purge(service)
    Fafactory.configure_site(service)
    Fafactory.delete(:purge)
    
    nil
  end
  
  private
  def self.configure_site(service)
    self.site = "http://0.0.0.0:#{FAFACTORY_CONFIG["service"]["port"]}"
  end
end